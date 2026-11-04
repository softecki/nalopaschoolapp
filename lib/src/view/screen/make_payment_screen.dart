 import 'dart:convert';

import 'package:dodomaapp/src/view/screen/menu_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/app_color.dart';
import '../../../core/app_data.dart';
import '../../../core/softpay_access.dart';
import '../../../generated/assets.dart';
import '../../data/database_helper.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text_field.dart';
import '../widget/dropdown.dart';
import 'softpay_checkout_screen.dart';

class MakePayment extends StatefulWidget {
  final String phone;
  MakePayment(this.phone, {super.key});

  @override
  _MakePaymentState createState() => _MakePaymentState();
}

class _MakePaymentState extends State<MakePayment> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController selectedServiceController = TextEditingController();

  List<Map<String, dynamic>> feesGroups = [];
  String? selectedFeesGroupId;
  bool isLoadingGroups = true;
  String providerLabel = 'Malipo Mtandao';
  String providerKey = 'malipo';

  @override
  void initState() {
    super.initState();
    _loadFeesGroups();
    _loadProvider();
  }

  Future<void> _loadProvider() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final loginPhone = widget.phone;
      final savedKey = prefs.getString('mobile_money_provider');
      final uri = Uri.parse('${AppData.url}/payment/provider').replace(
        queryParameters: {'phone': loginPhone},
      );
      final response = await http.get(
        uri,
        headers: {'Accept': 'application/json'},
      ).timeout(const Duration(seconds: 15));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final data = body is Map ? body['data'] : null;
        if (data is Map) {
          final rawProvider = data['provider']?.toString() ?? savedKey;
          final provider = SoftPayAccess.effectiveProvider(loginPhone, rawProvider);
          final label = SoftPayAccess.labelFor(provider);
          await prefs.setString('mobile_money_provider', provider);
          await prefs.setString('mobile_money_label', label);
          if (!mounted) return;
          setState(() {
            providerKey = provider;
            providerLabel = label;
          });
          return;
        }
      }
      if (!mounted) return;
      final provider = SoftPayAccess.effectiveProvider(loginPhone, savedKey);
      setState(() {
        providerKey = provider;
        providerLabel = SoftPayAccess.labelFor(provider);
      });
    } catch (_) {
      final prefs = await SharedPreferences.getInstance();
      if (!mounted) return;
      final provider = SoftPayAccess.effectiveProvider(
        widget.phone,
        prefs.getString('mobile_money_provider'),
      );
      setState(() {
        providerKey = provider;
        providerLabel = SoftPayAccess.labelFor(provider);
      });
    }
  }

  Future<void> _loadFeesGroups() async {
    final prefs = await SharedPreferences.getInstance();
    String? studentId = await prefs.getString('current_student');
    if (studentId != null) {
      final data = await DatabaseHelper.instance.getFeesGroupsForStudent(studentId);
      print("data");
      print(data);
      setState(() {
        feesGroups = data;
        isLoadingGroups = false;
        if (feesGroups.isNotEmpty) {
          selectedFeesGroupId = feesGroups.first['id'].toString();
        }
      });
    } else {
      setState(() { isLoadingGroups = false; });
    }
  }

  String generateReferenceNumberWithPrefix(String prefix) {
    final now = DateTime.now();
    final formatted = '${now.day.toString().padLeft(2, '0')}'
        '${now.hour.toString().padLeft(2, '0')}'
        '${now.minute.toString().padLeft(2, '0')}'
        '${now.second.toString().padLeft(2, '0')}';
    return '$prefix$formatted';
  }
  Future<void> register(BuildContext context) async {
    if (phoneController.text.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Enter full phonenumber to proceed",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    if (amountController.text.length < 2) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Enter correct amount above 10 TZS",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    if(selectedServiceController.text.length < 2) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Select Payment Service",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    if (selectedFeesGroupId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Select a fees group",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(
        child: CircularProgressIndicator(color: AppColor.primaryColor,),
      ),
    );
    final prefs = await SharedPreferences.getInstance();
    String? id = await prefs.getString('current_student');
    String? controlNumber = await DatabaseHelper.instance.getControlNumberByStudentId(id!);
    final paymentReference = generateReferenceNumberWithPrefix('MTPM');
    final url = Uri.parse('${AppData.url}/payment');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
      body: jsonEncode({
        'sender_account': phoneController.text,
        'amount': amountController.text,
        'phone': widget.phone,
        'control_number': controlNumber,
        'reference': paymentReference,
        'service': selectedServiceController.text,
        'fees_group_id': selectedFeesGroupId,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      final data = responseBody is Map ? responseBody['data'] : null;
      final provider = data is Map ? data['provider']?.toString() : providerKey;
      final executionUrl = data is Map
          ? (data['execution_url'] ?? data['checkout_url'])?.toString()
          : null;
      if (SoftPayAccess.canUseSoftPay(widget.phone, provider) &&
          executionUrl != null &&
          executionUrl.isNotEmpty) {
        if (!mounted) return;
        Navigator.of(context).pop();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => SoftPayCheckoutScreen(
              executionUrl: executionUrl,
              reference: paymentReference,
            ),
          ),
        );
        return;
      }
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            data is Map && data['message'] != null
                ? data['message'].toString()
                : 'Your request has been received. Confirm the prompt on your phone.',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
      Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    } else {
      if (mounted) Navigator.of(context).pop();
      String errorMsg = 'Payment failed';
      try {
        final body = jsonDecode(response.body);
        errorMsg = body['data']?['message']?.toString()
            ?? body['message']?.toString()
            ?? errorMsg;
      } catch (_) {}
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMsg)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: Text(
          "",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              // Sunken Image Container
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(-3, -3),
                      blurRadius: 6,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(0.9),
                      offset: Offset(3, 3),
                      blurRadius: 6,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Image.asset(
                  Assets.imagesNalopa,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),


              Text(
                "Pay your school fees securely and conveniently with $providerLabel. Just select a payment service, enter your phone number, and the fee amount.",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 15),

              // Fees Group Dropdown
              _buildSunkenField(
                child: isLoadingGroups
                  ? Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Select Fees Group',
                        border: InputBorder.none,
                      ),
                      value: selectedFeesGroupId,
                      onChanged: (String? newId) {
                        setState(() {
                          selectedFeesGroupId = newId;
                        });
                      },
                      items: feesGroups
                          .map((group) => DropdownMenuItem<String>(
                                value: group['id'].toString(),
                                child: Text(group['name'] ?? ''),
                              ))
                          .toList(),
                    ),
              ),

              const SizedBox(height: 15),
              MobileMoneyDropdown(selectedServiceController),
              const SizedBox(height: 15),
              // Sunken Phone Input
              _buildSunkenField(
                child: CustomTextField(
                  hintText: "Enter Phone number",
                  icon: Icons.phone,
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                ),
              ),

              const SizedBox(height: 15),

              // Sunken Amount Input
              _buildSunkenField(
                child: CustomTextField(
                  hintText: "Enter Amount",
                  icon: Icons.money_sharp,
                  controller: amountController,
                  keyboardType: TextInputType.number,
                ),
              ),

              const SizedBox(height: 15),

              // Sunken Button
              _buildSunkenField(
                child: CustomButton(
                  onPressed: () => register(context),
                  text: 'Pay',
                ),
              ),
            ],
          ),
        ),
      ),
    );


  }

  Widget _buildSunkenField({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(-3, -3),
            blurRadius: 6,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.9),
            offset: Offset(3, 3),
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: child,
    );
  }

}
