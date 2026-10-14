import 'dart:convert';

import 'package:dodomaapp/src/view/screen/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../core/app_color.dart';
import '../../../core/app_data.dart';
import '../../data/database_helper.dart';
import '../widget/custom_button.dart';

class StudentMarksPerSubjectPage extends StatefulWidget {
  final List<Map<String, dynamic>> students;
  final int subjectId;
  final int classId;
  final int sectionId;
  final int examTypeId;
  final String SubjectName;
  final String ClassName;


  StudentMarksPerSubjectPage({required this.students, required this.subjectId,
    required  this.classId,required this.sectionId,required this.examTypeId,required this.ClassName, required this.SubjectName});

  @override
  _StudentMarksPageState createState() => _StudentMarksPageState();
}

class _StudentMarksPageState extends State<StudentMarksPerSubjectPage> {
  Map<int, TextEditingController> marksControllers = {};
  int subjectId=0;
  int classId=0;
  int sectionId=0;
  int examTypeId=0;

  @override
  void initState() {
    super.initState();
    // Initialize controllers for each student
    for (var student in widget.students) {
      marksControllers[student['id']] = TextEditingController();
    }
    subjectId = widget.subjectId;
    classId = widget.classId;
    sectionId = widget.sectionId;
    examTypeId = widget.examTypeId;
  }

  @override
  void dispose() {
    // Dispose controllers to free memory
    for (var controller in marksControllers.values) {
      controller.dispose();
    }
    super.dispose();
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
          "Students Marks",
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
      body: Column(
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: EdgeInsets.all(8),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.ClassName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.SubjectName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.students.length,
              itemBuilder: (context, index) {
                final student = widget.students[index];
                return Column(
                  children: [
                    ListTile(
                      title: Text(student['name']),
                      subtitle : Text('No ${index + 1}'),
                      trailing: Text(student['mark'].toString()),
                    ),
                    const Divider( // Adds a bottom border
                      thickness: 1,
                      color: Colors.grey,
                      height: 0,
                    ),
                  ],
                );
              },
            ),
          ),


        ],
      ),
    );
  }
}
