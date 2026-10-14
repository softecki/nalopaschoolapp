import 'package:flutter/material.dart';

import '../../../core/app_color.dart';
import '../../data/database_helper.dart';
import 'menu_screen.dart';

class ResultViewer extends StatelessWidget {
  final Map<String, dynamic> responseData;
  String position='';String max_position='';
  String total_marks='';String avg_marks='';
  String result='';

   ResultViewer({super.key, required this.responseData});

  // Future<List<Map<String, dynamic>>> prepareMarksList() async {
  //   List<Map<String, dynamic>> marksList = [];
  //   List registers = responseData['data']['resultData']['marks_registers'];
  //   position = responseData['data']['resultData']['position'];
  //
  //   for (var register in registers) {
  //     var subjectId = register['subject_id'];
  //     var children = register['marks_register_childs'];
  //     String subjectName = await DatabaseHelper.instance.getSubjectNameById(subjectId.toString());
  //
  //     for (var child in children) {
  //       marksList.add({
  //         'subject_id': subjectId,
  //         'subject_name': subjectName,
  //         'mark': child['mark'],
  //         'grade':await DatabaseHelper.instance.getGradeNameByMarks(child['mark'])
  //       });
  //     }
  //   }
  //
  //   return marksList;
  // }

  Future<Map<String, dynamic>> prepareMarksData() async {
    List<Map<String, dynamic>> marksList = [];
    List registers = responseData['data']['resultData']['marks_registers'];
    String pos = responseData['data']['resultData']['position'].toString();
    String total_marks = responseData['data']['resultData']['total_marks'].toString();
    String avg_marks = responseData['data']['resultData']['avg_marks'].toString();
    String result = responseData['data']['resultData']['result'].toString();
    String max_position = responseData['data']['resultData']['max_position'].toString();

    for (var register in registers) {
      var subjectId = register['subject_id'];
      var children = register['marks_register_childs'];
      String subjectName = await DatabaseHelper.instance.getSubjectNameById(subjectId.toString());

      for (var child in children) {
        marksList.add({
          'subject_id': subjectId,
          'subject_name': subjectName,
          'mark': child['mark'],
          'grade': await DatabaseHelper.instance.getGradeNameByMarks(child['mark'].toString())
        });
      }
    }

    return {
      'marks': marksList,
      'position': pos,
      'max_position':max_position,
      'total_marks': total_marks,
      'avg_marks':avg_marks,
      'result':result
    };
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DashboardScreen()),
            );
          },
        ),
        title: Text(
          "Student Results",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColor.primaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<Map<String, dynamic>>(
              future: prepareMarksData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  print(snapshot);
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!['marks'].isEmpty) {
                  return Center(child: Text('No marks found.'));
                } else {
                  final marksList = snapshot.data!['marks'] as List<Map<String, dynamic>>;
                  final position = snapshot.data!['position'];
                  final max_position = snapshot.data!['max_position'];
                  final total_marks = snapshot.data!['total_marks'];
                  final avg_marks = snapshot.data!['avg_marks'];
                  final result = snapshot.data!['result'];

                  return Column(
                    children: [

                      Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.yellow, width: 2), // Yellow Border
                          borderRadius: BorderRadius.circular(12), // Rounded corners
                        ),
                        elevation: 4, // Small shadow
                        margin: EdgeInsets.all(6),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                          child: Column (
                children:[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Total Marks",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        total_marks,
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                      ),
                      Text(
                        "Avarage",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        double.parse(avg_marks).round().toString(),
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Position",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        position,
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                      ),
                      Text(
                        "Out Of",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        max_position,
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Result",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        result,
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                      ),
                      Text(
                        "",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '',
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                      ),
                    ],
                  )
                ]
                )
                ,
                        ),
                      ),

                      Card(
                        margin: EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: Colors.yellow.shade700, width: 2),
                        ),
                        elevation: 6,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Subjects",
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Marks",
                                    style: TextStyle(fontSize: 20, color: Colors.black87),
                                  ),

                                ],
                              )
                             ,
                              SizedBox(height: 12),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: marksList.length,
                                itemBuilder: (context, index) {
                                  final item = marksList[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          item['subject_name'] ?? '',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          "${item['mark'] ?? ''} (${item['grade'] ?? ''})",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.teal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      )

                      // Expanded(
                      //   child: ListView.builder(
                      //     itemCount: marksList.length,
                      //     itemBuilder: (context, index) {
                      //       final item = marksList[index];
                      //       return ListTile(
                      //         title: Text("Subject: ${item['subject_name']}"),
                      //         trailing: Text("Marks: ${item['mark']} (${item['grade']})"),
                      //       );
                      //     },
                      //   ),
                      // ),
                    ],
                  );
                }
              },
            ),
          )

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Text(
          //       "Position",
          //       style: TextStyle(fontSize: 20),
          //     ),
          //     Text(
          //       position,
          //       style: TextStyle(fontSize: 20),
          //     ),
          //   ],
          // ),
          // Expanded(
          //   child: FutureBuilder<List<Map<String, dynamic>>>(
          //     future: prepareMarksList(),
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return Center(child: CircularProgressIndicator());
          //       } else if (snapshot.hasError) {
          //         return Center(child: Text('Error: ${snapshot.error}'));
          //       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          //         return Center(child: Text('No marks found.'));
          //       } else {
          //         final marksList = snapshot.data!;
          //
          //         return ListView.builder(
          //           itemCount: marksList.length,
          //           itemBuilder: (context, index) {
          //             final item = marksList[index];
          //             return ListTile(
          //               title: Text("Subject: ${item['subject_name']}"),
          //               // subtitle: Text("Mark: ${item['mark']}"),
          //               trailing: Text("Mark: ${item['mark']} (${item['grade']})"),
          //             );
          //           },
          //         );
          //       }
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}

