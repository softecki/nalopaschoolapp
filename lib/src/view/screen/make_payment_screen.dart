 import 'dart:convert';

import 'package:dodomaapp/src/view/screen/menu_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/app_color.dart';
import '../../../core/app_data.dart';
import '../../../generated/assets.dart';
import '../../data/database_helper.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text_field.dart';
import '../widget/dropdown.dart';

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

  @override
  void initState() {
    super.initState();
    _loadFeesGroups();
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
    String? reference = await DatabaseHelper.instance.getControlNumberByStudentId(id!);
    final url = Uri.parse(AppData.url+'/payment');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'sender_account': phoneController.text,
        'amount': amountController.text,
        'phone': widget.phone,
        'control_number':reference,
        'reference': generateReferenceNumberWithPrefix('MTPM'),
        'service': selectedServiceController.text,
        'fees_group_id': selectedFeesGroupId,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Your Request has been received. We are processing",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
      Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    } else {
      Navigator.of(context).pop();
      final errorMsg = jsonDecode(response.body)['message'] ?? 'Registration Failed';
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


              const Text(
                "Pay your school fees securely and conveniently with Malipo Mtandao. Just select a payment service, enter your Phone number, and the fee amount.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),textAlign: TextAlign.center,
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
