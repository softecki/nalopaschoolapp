import 'dart:convert';

import 'package:dodomaapp/src/view/screen/students_marks_page.dart';
import 'package:dodomaapp/src/view/screen/view_result.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/app_color.dart';
import '../../../core/app_data.dart';
import '../../data/database_helper.dart';
import 'exam_form.dart';
import 'exam_list_screen.dart';
import 'menu_screen.dart';

// Model for each exam result entry
class ExamResult {
  final String subject;
  final String marks;
  final String grade;
  final String comment;

  ExamResult({
    required this.subject,
    required this.marks,
    required this.grade,
    required this.comment,
  });
}

class ExamResultScreen extends StatefulWidget {
  @override
  _ExamResultScreenState createState() => _ExamResultScreenState();
}

class _ExamResultScreenState extends State<ExamResultScreen> {
  // List of available exams for the dropdown
  final List<String> exams_ = ["Second Exam", "First Exam", "Third Exam"];
  String? selectedExam = "Second Exam";

  // Sample exam result data
  final List<ExamResult> results = [
    ExamResult(subject: "English", marks: "-", grade: "-", comment: "-"),
    ExamResult(subject: "Science", marks: "-", grade: "-", comment: "-"),
    ExamResult(subject: "Mathematics", marks: "-", grade: "-", comment: "-"),
  ];

  // Summary data
  final String totalMarks = "0 / 300";
  final String gpa = "0.0";
  final String status = "Fail";

  List<Exam> exams = [];
  late final List<Map<String, dynamic>> students;
  Future<List<Exam>> fetchExams() async {
    final prefs =  await SharedPreferences.getInstance();
    String? student_id = prefs.getString('current_student');
    if(student_id!.isNotEmpty) {
      return await DatabaseHelper.instance.getExamsTypesWithStudentId(student_id);
    }else{
      return await DatabaseHelper.instance.getExamsTypes();
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
                context, MaterialPageRoute(builder: (context) => DashboardScreen()));
          },
        ),
        title: Text(
          "Exam Results",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20, // You can adjust this size as needed
            fontWeight: FontWeight.bold, // Optional: makes the title bold
          ),
        ),
        backgroundColor: AppColor.primaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications,color:Colors.white),
            onPressed: () {
              // Handle notification button press
            },
          ),
        ],
      ),
        body: FutureBuilder<List<Exam>>(
            future: fetchExams(), // Fetch exams dynamically
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Center(child: Text("Error loading exams"));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text("No exams available"));
              }

              List<Exam> exams = snapshot.data!;
              return Column(
                children: [


                  // Expanded ListView
                  Expanded(
                    child: ListView.builder(
                      itemCount: exams.length,
                      itemBuilder: (context, index) {
                        final exam = exams[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                          child: Card(
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.description,
                                        color: Colors.white,
                                        size: 30.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16.0),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          exam.examTypeName,
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        SizedBox(height: 4.0),
                                        Text(
                                          exam.class_name+" | "+"Section "+exam.section_name,
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.more_vert, color: Colors.grey),
                                    onPressed: () => _showMoreOptions(context, exam.id),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),        ],
              );})
    );
  }

  void _showMoreOptions(BuildContext context, int examId) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.remove_red_eye_sharp),
              title: Text("View"),
              onTap: () async {
                final List<Map<String, dynamic>> students;
                final url = Uri.parse(AppData.url+'/get-results');
                List<Map<String, dynamic>> student = await DatabaseHelper.instance.getStudents();

                List<Map<String, Object?>> exists = await DatabaseHelper.instance.getExamExists(
                    id: examId
                );
                print(exists.first['classId']);
                print(exists.first['sectionId']);
                print(exists.first['examTypeId']);
                print(student.first['id']);
                final response = await http.post(
                  url,
                  body: jsonEncode({
                    'class': exists.first['classId'] ,
                    'section': exists.first['sectionId'],
                    'exam_type': exists.first['examTypeId'],
                    'student': student.first['id'],
                  }),
                  headers: {'Content-Type': 'application/json'},
                );

                if (response.statusCode == 200) {
                  final data = jsonDecode(response.body);
                  print(data);

                  // students = List<Map<String, dynamic>>.from(data['students']);


                  // Navigate to Student Marks Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultViewer( responseData: data,),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Success to fetch results")),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Failed to fetch students")),
                  );
                }
                // Navigator.pop(context);
                print("View Exam ID: $examId");
                // Handle view action with examId
              },
            ),


          ],
        );
      },
    );
  }


  // Build a circular summary card
  Widget _buildSummaryCard(String text, Color color) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

