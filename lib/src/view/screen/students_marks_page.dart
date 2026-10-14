import 'dart:convert';

import 'package:dodomaapp/src/view/screen/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../core/app_color.dart';
import '../../../core/app_data.dart';
import '../../data/database_helper.dart';
import '../widget/custom_button.dart';
import 'exam_form.dart';

class StudentMarksPage extends StatefulWidget {
  final List<Map<String, dynamic>> students;
  final int subjectId;
  final int classId;
  final int sectionId;
  final int examTypeId;

  StudentMarksPage({required this.students, required this.subjectId,
    required  this.classId,required this.sectionId,required this.examTypeId});

  @override
  _StudentMarksPageState createState() => _StudentMarksPageState();
}

class _StudentMarksPageState extends State<StudentMarksPage> {
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

  Future<void> submitMarks() async {
    List<Map<String, dynamic>> submittedMarks = [];
    List<Map<String, dynamic>> marksregisters = [];
    bool exists = await DatabaseHelper.instance.checkExamExists(
      sectionId: sectionId,
      examTypeId: examTypeId,
      subjectId: subjectId,
      classId: classId,
    );
    int id = 0;
    if (!exists) {
      id = await DatabaseHelper.instance.insertExam(
          sectionId: sectionId.toString(),
          examTypeId: examTypeId.toString(),
          subjectId: subjectId.toString(),
          classId: classId.toString(),
          status: '0',
          marks:submittedMarks
      );}
    for (var student in widget.students) {

      String marks = marksControllers[student['id']]!.text;
      String marksText = marksControllers[student['id']]!.text;

      if (marksText.isNotEmpty && marksText != "Marks") {
        int marks = int.tryParse(marksText) ?? -1; // Convert to int, default to -1 if invalid

        if (marks < 0 || marks > 100) {
          // Show a Snackbar message if marks are out of range
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Marks for ${student['name']} must be between 0 and 100"),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 2),
            ),
          );
          return; // Stop execution to prevent adding invalid data
        }

        submittedMarks.add({
          'id': student['id'],
          'name': student['name'],
          'marks': marks,
        });
        marksregisters.add({
          'marks_register_id': id,
          'student_id':  student['id'],
          'title': 'written',
          'mark': marks,
        });

      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Marks for ${student['name']} must be between 0 and 100"),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
        return;

      }

    }

    print("Submitted Marks: $submittedMarks");

    // for (var child in marksregisters) {
    //   await DatabaseHelper.instance.insertMarksRegisterChildren(child);
    // }

    final url = Uri.parse(AppData.url+'/storeresults');
    print(jsonEncode({
      'submittedMarks': submittedMarks,
      'section': sectionId,
      'exam_type': examTypeId,
      'subject': subjectId,
      'class': classId,
    }));

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
        'submittedMarks': submittedMarks,
        'section': sectionId,
        'exam_type': examTypeId,
        'subject': subjectId,
        'class': classId,
      }),
      headers: {'Content-Type': 'application/json'},
    );
    print(response.body);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if(id>0) {
        await DatabaseHelper.instance.updateExamStatusToOne(id);
      }
      // Navigate to Student Marks Page
      Navigator.of(context).pop();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => DashboardScreen()));

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Marks submitted successfully!")),
      );
    } else {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to fetch students")),
      );
    }
    // Replace this with API submission

    // Show a confirmation message

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color:Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => ExamFormScreen()));
          },
        ),
        title: Text(
          "Students Marks Form",
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
          Expanded(
            child: ListView.builder(
              itemCount: widget.students.length,
              itemBuilder: (context, index) {
                final student = widget.students[index];
                return Column(
                  children: [
                    ListTile(
                      title: Text(student['name']),
                      // subtitle:Text(student['mark'].toString()),
                      trailing: SizedBox(
                        width: 100, // Limit input field width
                        child: TextField(
                          controller: marksControllers[student['id']],
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: "Marks",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
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
          CustomButton(
            onPressed: () => submitMarks(),
            text: 'Register',
          ),

        ],
      ),
    );
  }
}
