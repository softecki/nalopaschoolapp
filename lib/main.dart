import 'dart:convert';

import 'package:dodomaapp/src/view/screen/login_screen.dart';
import 'package:dodomaapp/src/view/screen/menu_screen.dart';
import 'package:flutter/material.dart';
import 'dart:ui' show PointerDeviceKind;
import 'package:dodomaapp/core/app_theme.dart';
import 'package:dodomaapp/src/data/database_helper.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/app_color.dart';
import 'core/app_data.dart';
import 'generated/assets.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppData.School_name,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        },
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: AppTheme.lightAppTheme,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}


class _SplashScreenState extends State< SplashScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      splash(context);
    });
  }

  Future<void> splash(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(
        child: CircularProgressIndicator(color: AppColor.primaryColor),
      ),
    );

    try {
      final url = Uri.parse('${AppData.url}/splash');
      final info = await PackageInfo.fromPlatform();
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'version_name': info.version,
          'version_code': info.buildNumber,
        }),
      );

      if (response.statusCode == 200) {
        final prefs = await SharedPreferences.getInstance();
        final data = jsonDecode(response.body)['data'];

        await _storeDataLocally(data);

        Navigator.of(context).pop(); // Close loading

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) =>  LoginScreen(),
          ),
        );
      } else {
        final errorMsg = jsonDecode(response.body)['message'] ?? 'Splash failed';
        _showError(errorMsg);
      }
    } catch (e) {
      _showError(e.toString());
    }
  }

  Future<void> _storeDataLocally(Map<String, dynamic> data) async {
    final db = DatabaseHelper.instance;

    for (var item in data['notice']) await db.insertNotice(item);
    for (var item in data['examTypes']) await db.insertExamTypes(item);
    for (var item in data['classes']) await db.insertClasses(item);
    for (var item in data['sections']) await db.insertSection(item);
    for (var item in data['subjects']) await db.insertSubject(item);
    // for (var item in data['marks_registers']) {
    //   await db.insertExam(
    //     sectionId: item['section_id'].toString(),
    //     examTypeId: item['exam_type_id'].toString(),
    //     subjectId: item['subject_id'].toString(),
    //     classId: item['classes_id'].toString(),
    //     marks: [],
    //     status: '1',
    //   );
    // }
    // for (var item in data['marks_register_childrens']) {
    //   await db.insertMarksRegisterChildrenFromLogin(item);
    // }
    for (var item in data['fees_masters']) await db.insertFee(item);
    for (var item in data['fees_type']) await db.insertFeeType(item);
    for (var item in data['fees_group']) await db.insertFeeGroup(item);
    for (var item in data['bank_accounts']) await db.insertBankAccounts(item);
    // for (var item in data['subject_assign_childrens']) await db.insertSubjectAssignChildren(item);
    // for (var item in data['subject_assigns']) await db.insertSubjectAssign(item);
    // for (var item in data['grades']) await db.insertGrades(item);
    // for (var item in data['student_list']) await db.insertStudentList(item);
  }

  void _showError(String message) {
    Navigator.of(context).pop(); // Close loading
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFccbd00),
      body: Center(
        child: Image.asset(
          Assets.imagesNalopa,
          fit: BoxFit.cover,
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
