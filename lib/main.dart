import 'dart:convert';

import 'package:dodomaapp/src/data/offline_scan_store.dart';
import 'package:dodomaapp/src/data/offline_sync.dart';
import 'package:dodomaapp/src/view/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'dart:ui' show PointerDeviceKind;
import 'package:dodomaapp/core/app_theme.dart';
import 'package:dodomaapp/src/data/database_helper.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/app_data.dart';
import 'generated/assets.dart';

void main() {
  OfflineSync.start();
  runApp(const MyApp());
}

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

        if (!context.mounted) return;
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

    // One malformed row must not block startup; log it and keep going.
    Future<void> each(String key, Future<dynamic> Function(Map<String, dynamic>) insert) async {
      final items = data[key];
      if (items is! List) return;
      for (final item in items) {
        try {
          await insert(Map<String, dynamic>.from(item as Map));
        } catch (e) {
          debugPrint('Splash: failed to store $key row: $e');
        }
      }
    }

    await each('notice', db.insertNotice);
    await each('examTypes', db.insertExamTypes);
    await each('classes', db.insertClasses);
    await each('sections', db.insertSection);
    await each('subjects', db.insertSubject);
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
    await each('fees_masters', db.insertFee);
    await each('fees_type', db.insertFeeType);
    await each('fees_group', db.insertFeeGroup);
    await each('bank_accounts', db.insertBankAccounts);
    final scanStudents = data['scan_students'];
    if (scanStudents is List) {
      await OfflineScanStore.saveStudents(scanStudents);
    }
    final prefs = await SharedPreferences.getInstance();
    // Splash has no login phone; SoftPay is resolved later with phone on
    // /payment/provider. Persist splash values only when not SoftPay so a
    // previous SoftPay session cannot leak branding to other users.
    final provider = data['mobile_money_provider']?.toString();
    final label = data['mobile_money_label']?.toString();
    if (provider != null && provider.isNotEmpty && provider != 'softepay') {
      await prefs.setString('mobile_money_provider', provider);
      if (label != null && label.isNotEmpty) {
        await prefs.setString('mobile_money_label', label);
      }
    } else if (provider == 'softepay') {
      await prefs.setString('mobile_money_provider', 'malipo');
      await prefs.setString('mobile_money_label', 'Malipo Mtandao');
    }
    // for (var item in data['subject_assign_childrens']) await db.insertSubjectAssignChildren(item);
    // for (var item in data['subject_assigns']) await db.insertSubjectAssign(item);
    // for (var item in data['grades']) await db.insertGrades(item);
    // for (var item in data['student_list']) await db.insertStudentList(item);
  }

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFccbd00),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                Assets.imagesNalopa,
                fit: BoxFit.contain,
                width: 140,
                height: 140,
              ),
              const SizedBox(height: 28),
              const Text(
                'Welcome to Nalopa School',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Please wait while the app is loading',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              const SizedBox(height: 28),
              const CircularProgressIndicator(color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
