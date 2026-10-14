import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../core/app_color.dart';
import '../../../core/app_data.dart';
import '../../../generated/assets.dart';
import '../../data/database_helper.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text_field.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> register(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(
        child: CircularProgressIndicator(color: AppColor.primaryColor,),
      ),
    );
    final url = Uri.parse(AppData.url+'/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': nameController.text,
        'phone': phoneController.text,
        'email': emailController.text,
        'password': passwordController.text,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      final user = {
        'name': nameController.text,
        'phone': phoneController.text,
        'email': emailController.text,
        'password': passwordController.text, // Hash in real apps
      };
      // await DatabaseHelper.instance.insertUser(user);
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("User Registered!")));

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
      Navigator.pop(context); // Go back to login after success
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
      appBar: AppBar(title: const Text('')),
      body: SingleChildScrollView( // ✅ Allows scrolling to prevent overflow
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Aligns content to the left
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

              const SizedBox(height: 15),
              CustomTextField(
                hintText: "Enter your phone number",
                icon: Icons.phone,
                controller: phoneController,
              ),

              const SizedBox(height: 20),
              CustomButton(
                onPressed: () => register(context),
                text: 'Click to get OTP',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
