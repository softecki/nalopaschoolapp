import 'dart:convert';

import 'package:dodomaapp/src/view/screen/student_edit_results.dart';
import 'package:dodomaapp/src/view/screen/students_marks_page.dart';
import 'package:dodomaapp/src/view/screen/studnt_view_result_per_subject.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../core/app_color.dart';
import '../../../core/app_data.dart';
import '../../data/database_helper.dart';
import 'exam_form.dart';
import 'menu_screen.dart';

// Model for each exam entry
class Exam {
  final int id;
  final String examTypeName;
  final String class_name;
  final String subject_name;
  final String section_name;// Added field

  Exam({
    required this.id,
    required this.examTypeName,
    required this.class_name,
    required this.subject_name,
    required this.section_name,
  });

  // Convert from SQLite query result
  factory Exam.fromMap(Map<String, dynamic> map) {
    return Exam(
      id: map['id'],
        examTypeName: map['examTypeName'],
        class_name:map['class_name'],
        subject_name:map['subject_name']??'',
        section_name:map['section_name']
    );
  }
}

class ExamListScreen extends StatelessWidget {
  // Sample exam data
  List<Exam> exams = [];
  late final List<Map<String, dynamic>> students;

  Future<List<Exam>> fetchExams() async {

    return await DatabaseHelper.instance.getExams();
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
          "Exam List",
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
    return Center(child: Text("Error loading exams"));
    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
    return Center(child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                // Handle Add button press
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExamFormScreen()),
                );
              },
              icon: Icon(Icons.add,color: Colors.white),
              label: Text("Upload Results",style: TextStyle(
                  color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor,
                padding: EdgeInsets.symmetric(vertical: 12.0),
                textStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Text("No exams available")
      ],
    ) );
    }

    List<Exam> exams = snapshot.data!;
    return Column(
        children: [
          // Add Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle Add button press
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ExamFormScreen()),
                  );
                },
                icon: Icon(Icons.add,color: Colors.white),
                label: Text("Upload Results",style: TextStyle(
                                    color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  textStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

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
                                  exam.class_name+"("+exam.section_name+")"+" | "+exam.subject_name,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.bold
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

  // Function to show more options (e.g., a popup menu)
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
                final url = Uri.parse(AppData.url+'/getResultsPerSubject');
                List<Map<String, Object?>> exists = await DatabaseHelper.instance.getExamExists(
                  id: examId
                );
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
                    'class': exists.first['classId'] ,
                    'section': exists.first['sectionId'],
                    'exam_type': exists.first['examTypeId'],
                    'subject': exists.first['subjectId'],
                  }),
                  headers: {'Content-Type': 'application/json'},
                );

                if (response.statusCode == 200) {
                  final data = jsonDecode(response.body);

                    students = List<Map<String, dynamic>>.from(data['students']);
                    print(students);
                  String SubjectName = await DatabaseHelper.instance.getSubjectNameById(exists.first['subjectId'].toString());
                  String ClassName = await DatabaseHelper.instance.getClassNameById(exists.first['classId'].toString());

                  // Navigate to Student Marks Page
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentMarksPerSubjectPage(students: students,
                          classId:exists.first['classId'] as int,sectionId:exists.first['sectionId'] as int,examTypeId:exists.first['examTypeId'] as int,
                          subjectId:exists.first['subjectId'] as int,SubjectName:SubjectName,ClassName:ClassName),
                    ),
                  );
                } else {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Failed to fetch students")),
                  );
                }

              },
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text("Edit"),
              onTap: () async {
                final List<Map<String, dynamic>> students;
                final url = Uri.parse(AppData.url+'/getResultsForEditingPerSubject');
                List<Map<String, Object?>> exists = await DatabaseHelper.instance.getExamExists(
                    id: examId
                );
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
                    'class': exists.first['classId'] ,
                    'section': exists.first['sectionId'],
                    'exam_type': exists.first['examTypeId'],
                    'subject': exists.first['subjectId'],
                  }),
                  headers: {'Content-Type': 'application/json'},
                );
                print(response.body);
                if (response.statusCode == 200) {
                  final data = jsonDecode(response.body);

                  students = List<Map<String, dynamic>>.from(data['students']);
                  print(students);
                  String SubjectName = await DatabaseHelper.instance.getSubjectNameById(exists.first['subjectId'].toString());
                  String ClassName = await DatabaseHelper.instance.getClassNameById(exists.first['classId'].toString());

                  // Navigate to Student Marks Page
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentEditMarksPerSubjectPage(students: students,
                          classId:exists.first['classId'] as int,sectionId:exists.first['sectionId'] as int,examTypeId:exists.first['examTypeId'] as int,
                          subjectId:exists.first['subjectId'] as int,SubjectName:SubjectName,ClassName:ClassName),
                    ),
                  );
                } else {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Failed to fetch students")),
                  );
                }

              },
            ),
            // ListTile(
            //   leading: Icon(Icons.delete),
            //   title: Text("Delete"),
            //   onTap: () {
            //     Navigator.pop(context);
            //     print("Delete Exam ID: $examId");
            //     // Handle delete action with examId
            //   },
            // ),
          ],
        );
      },
    );
  }
}

