import 'package:dodomaapp/src/view/screen/exam_list_screen.dart';
import 'package:dodomaapp/src/view/screen/students_marks_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../core/app_color.dart';
import '../../../core/app_data.dart';
import '../../data/database_helper.dart';
import '../widget/custom_button.dart';
import '../widget/custom_dropdown.dart';
import 'menu_screen.dart';

class ExamFormScreen extends StatefulWidget {
  @override
  _ExamFormScreenState createState() => _ExamFormScreenState();
}

class _ExamFormScreenState extends State<ExamFormScreen> {
  String? selectedClass;
  String? selectedSection;
  String? selectedExamType;
  String? selectedSubject;
  List<Map<String, dynamic>> students = [];
  List<String> classes = [];
  List<String> sections = [];
  List<String> examTypes = [];
  List<String> subjects = [];

  @override
  void initState() {
    super.initState();
    fetchClasses(); // Load classes when the screen initializes
  }

  Future<void> fetchClasses() async {
    final dbHelper = DatabaseHelper.instance;
    List<String> fetchedClasses = await dbHelper.getAllClasses();
    List<String> fetchedSections = await dbHelper.getAllSections();
    List<String> fetchedExamTypes = await dbHelper.getExamTypes();
    List<String> fetchedSubjects = await dbHelper.getAllSubjects();

    setState(() {
      classes = fetchedClasses;
      sections = fetchedSections;
      examTypes = fetchedExamTypes;
      subjects = fetchedSubjects;
    });
  }




  Future<void> fetchStudents() async {
    if (selectedClass == null ||
        selectedSection == null ||
        selectedExamType == null ||
        selectedSubject == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select all fields")),
      );
      return;
    }

    final url = Uri.parse(AppData.url+'/get-students');
    final dbHelper = DatabaseHelper.instance;
    int? classId = await dbHelper.getClassIdByName(selectedClass!);
    int? sectionId = await dbHelper.getSectionIdByName(selectedSection!);
    int? examTypeId = await dbHelper.getExamTypeIdByName(selectedExamType!);
    int? subjectId = await dbHelper.getSubjectIdByName(selectedSubject!);

    if (classId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Class not found in database")),
      );
      return;
    }

    if (sectionId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Section not found in database")),
      );
      return;
    }

    if (examTypeId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Exams not found in database")),
      );
      return;
    }

    if (subjectId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Subject not found in database")),
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
    final response = await http.post(
      url,
      body: jsonEncode({
        'class': classId,
        'section': sectionId,
        'exam_type': examTypeId,
        'subject': subjectId,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        students = List<Map<String, dynamic>>.from(data['students']);
      });

      // Navigate to Student Marks Page
      Navigator.of(context).pop();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StudentMarksPage(students: students,
              classId:classId,sectionId:sectionId,examTypeId:examTypeId,
              subjectId:subjectId),
        ),
      );
    } else {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to fetch students")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color:Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => ExamListScreen()));
          },
        ),
        title: Text(
          "Exam Form",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20, // You can adjust this size as needed
            fontWeight: FontWeight.bold, // Optional: makes the title bold
          ),
        ),
        backgroundColor: AppColor.primaryColor,
        actions: [

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: selectedClass,
              items: classes
                  .map((e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ))
                  .toList(),
              onChanged: (val) => setState(() => selectedClass = val),
              decoration: InputDecoration(
                labelText: "Class",
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.school, color: Colors.blueGrey), // Optional: Add an icon
                contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blueGrey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blueGrey, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blue, width: 2), // Customize the focus color
                ),
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedSection,
              items: sections
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => setState(() => selectedSection = val),
              decoration: InputDecoration(
                labelText: "Section",
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.school_outlined, color: Colors.blueGrey), // Optional: Add an icon
                contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blueGrey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blueGrey, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blue, width: 2), // Customize the focus color
                ),
              ),

            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedExamType,
              items: examTypes
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => setState(() => selectedExamType = val),
              decoration: InputDecoration(
                labelText: "Select Exam Type",
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.receipt, color: Colors.blueGrey), // Optional: Add an icon
                contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blueGrey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blueGrey, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blue, width: 2), // Customize the focus color
                ),
              ),

            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedSubject,
              items: subjects
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => setState(() => selectedSubject = val),
              decoration: InputDecoration(
                labelText: "Select Subject",
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.subject, color: Colors.blueGrey), // Optional: Add an icon
                contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blueGrey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blueGrey, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blue, width: 2), // Customize the focus color
                ),
              ),

            ),
            SizedBox(height: 20),
            CustomButton(
              onPressed: () => fetchStudents(),
              text: 'Register',
            ),

          ],
        ),
      ),
    );
  }
}
