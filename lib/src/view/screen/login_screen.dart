import 'package:dodomaapp/core/app_color.dart';
import 'package:dodomaapp/generated/assets.dart';
import 'package:dodomaapp/src/view/screen/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/app_data.dart';
import '../../data/database_helper.dart';
import '../../static.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text_button.dart';
import '../widget/custom_text_field.dart';
import 'register_screen.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(
        child: CircularProgressIndicator(color: AppColor.primaryColor,),
      ),
    );
    final url = Uri.parse(AppData.url+'/login');
    final info = await PackageInfo.fromPlatform();
    final versionCode = info.buildNumber;  // this is the +5 part
    final versionName = info.version;
    try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': emailController.text,
        'password': passwordController.text,
        'version_name': versionName,
        'version_code': versionCode,
      }),
    );
    final email = emailController.text;
    final password = passwordController.text;

    if (response.statusCode == 200) {
      final prefs =  await SharedPreferences.getInstance();
      prefs.setString('code_number', emailController.text.toString());
      final user = await DatabaseHelper.instance.getUserByEmail(email);
      final responseBody = jsonDecode(response.body);
      final userData = Map<String, dynamic>.from(responseBody['data']['user'] as Map);
      final studentData = responseBody['data']['student'] is List ? responseBody['data']['student'] as List : [];
      final parentData = responseBody['data']['parent'] is List ? responseBody['data']['parent'] as List : [];
      final feesAssignStudent = responseBody['data']['feesAssignChildren'] is List ? responseBody['data']['feesAssignChildren'] as List : [];
      final transactions = responseBody['data']['transactions'] is List ? responseBody['data']['transactions'] as List : [];
      final staffs = responseBody['data']['staff'] is List ? responseBody['data']['staff'] as List : [];

      //
      await prefs.setString('role', userData['role_id']?.toString() ?? '');
      final features = responseBody['data']['app_features'];
      if (features is List) {
        await prefs.setString('app_features', jsonEncode(features));
      } else {
        await prefs.remove('app_features');
      }
      final users = {
        'name': userData['name']?.toString() ?? '',
        'phone': userData['phone']?.toString() ?? '',
        'email': userData['email']?.toString() ?? '',
        'role_id': userData['role_id']?.toString() ?? '',
        'password': password,
        'status':"1",
        'id': userData['id']?.toString() ?? '',
      };

      // Save to database
      if((user == null)) {
        await DatabaseHelper.instance.insertUser(users);
      }

      for (var student in studentData) {
        try { await DatabaseHelper.instance.insertStudent(Map<String, dynamic>.from(student as Map)); } catch (_) {}
      }
      for (var parent in parentData) {
        try { await DatabaseHelper.instance.insertParent(Map<String, dynamic>.from(parent as Map)); } catch (_) {}
      }

      await DatabaseHelper.instance.deleteFeesAssignmentsForStudents(
        studentData.map((s) => s is Map ? s['id'] : null),
      );
      for (var feesAssign in feesAssignStudent) {
        try { await DatabaseHelper.instance.insertFeesAssignment(Map<String, dynamic>.from(feesAssign as Map)); } catch (_) {}
      }
      await DatabaseHelper.instance.saveFeesSummary(responseBody['data']['feesSummary']);

      for (var transaction in transactions) {
        try { await DatabaseHelper.instance.insertFeeTransactions(Map<String, dynamic>.from(transaction as Map)); } catch (_) {}
      }

      for (var staff in staffs) {
        try { await DatabaseHelper.instance.insertStaff(Map<String, dynamic>.from(staff as Map)); } catch (_) {}
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login Successful')),
      );
      constant().isItLogged = true;
      // Navigate to HomeScreen or Dashboard
      Navigator.of(context).pop();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    } else {

      final errorMsg = jsonDecode(response.body)['message'] ?? 'Login Failed';
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMsg)),
      );
    }
    } catch (e) {
      Navigator.of(context).pop(); // Remove loader on error
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.imagesNalopa,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            const Text(
              "Welcome at",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
             Text(
              AppData.School_name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hintText: "Enter your Phone number",
              icon: Icons.phone,
              controller: emailController,
            ),
            const SizedBox(height: 15),

            CustomButton(
              text: "Login",
              onPressed: () => login(context),
              isLoading: false, // Set to true when processing
            ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween, // Aligns items on both ends
            //   children: [
            //     CustomTextButton(
            //       text: "Forgot Password?",
            //       onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen())),
            //       textColor: Colors.red,
            //     ),
            //     CustomTextButton(
            //       text: "Sign Up",
            //       onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen())),
            //       icon: Icons.person_add, // Optional icon
            //       textColor: AppColor.primaryColor,
            //     ),
            //   ],
            // ),

          ],
        ),
      ),
    );
  }
}
