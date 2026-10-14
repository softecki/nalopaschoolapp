import 'dart:convert';

import 'package:dodomaapp/core/app_color.dart';
import 'package:dodomaapp/src/view/screen/attendance_screen.dart';
import 'package:dodomaapp/src/view/screen/exam_list_screen.dart';
import 'package:dodomaapp/src/view/screen/fees_payment_list.dart';
import 'package:dodomaapp/src/view/screen/holiday_screen.dart';
import 'package:dodomaapp/src/view/screen/notice_screen.dart';
import 'package:dodomaapp/src/view/screen/student_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:dodomaapp/src/data/database_helper.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/app_data.dart';
import '../../../generated/assets.dart';
import '../../static.dart';
import 'chart_screen.dart';
import 'class_timetable_screen.dart';
import 'exam_result_screen.dart';
import 'fee_payment_screen.dart';
import 'library_screen.dart';
import 'login_screen.dart';
import 'package:intl/intl.dart';
import 'make_payment_screen.dart';
import 'qr_code_scanner_screen.dart';






class DashboardScreen extends StatelessWidget {
  late final String role_id;

  Widget _neumorphicButton(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 8,
            ),
            BoxShadow(
              color: Colors.grey.shade500,
              offset: Offset(4, 4),
              blurRadius: 8,
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.red[900], fontSize: 16),
        ),
      ),
    );
  }

  Widget _recommendedProductListView(BuildContext context) {

    return FutureBuilder<List<Map<String, dynamic>>?>(
      future: DatabaseHelper.instance.getStudentsWithDetails(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return Center(child: Text('No user data available'));
        }

        // Extract user data from snapshot
        List<Map<String, dynamic>>? firstUser = snapshot.data;


        return SizedBox(
          height: 170,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: AppData.recommendedProducts.length,
            itemBuilder: (_, index) {
              return StudentCardWidget(
                students: firstUser??[],
                roleId: role_id,
              );

            },
          ),
        );
      },
    );
  }

  Future<Map<String, dynamic>?> _getFirstUser() async {
    final prefs =  await SharedPreferences.getInstance();
    role_id = prefs.getString('role')??'7';
    return await DatabaseHelper.instance.getFirstStudent();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>?>(
      future: _getFirstUser(),
      builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Dashboard', style: TextStyle(color: Colors.white, fontSize: 20)),
              backgroundColor: AppColor.primaryColor,
            ),
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Dashboard', style: TextStyle(color: Colors.white, fontSize: 20)),
              backgroundColor: AppColor.primaryColor,
            ),
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        }

        final firstUser = snapshot.data;
        List<Map<String, dynamic>> menuItems = [];
        if(role_id=='5') {
          menuItems = [
            {'icon': Icons.person, 'label': 'Profile', 'color': Colors.blue},
            {
              'icon': Icons.payment,
              'label': 'Fee Payment',
              'color': Colors.deepPurple
            },
            {'icon': Icons.grade, 'label': 'Exam Result', 'color': Colors.pink},
            {
              'icon': Icons.assignment,
              'label': 'Upload Result',
              'color': Colors.yellow
            },
            {
              'icon': Icons.receipt_long,
              'label': 'Payment List',
              'color': Colors.blue
            },
            {
              'icon': Icons.check_circle,
              'label': 'Attendance',
              'color': Colors.orange
            },
            {
              'icon': Icons.notifications,
              'label': 'Notice',
              'color': Colors.purple
            },
            {
              'icon': Icons.calendar_today,
              'label': 'Class Routine',
              'color': Colors.green
            },
            {
              'icon': Icons.email,
              'label': 'Message',
              'color': Colors.blueAccent
            },
            {
              'icon': Icons.card_giftcard,
              'label': 'Holiday',
              'color': Colors.red
            },
            {
              'icon': Icons.home_work,
              'label': 'Homework',
              'color': Colors.orange
            },
            {
              'icon': Icons.library_books,
              'label': 'Library',
              'color': Colors.purple
            },
            {
              'icon': Icons.qr_code_scanner,
              'label': 'QR Scanner',
              'color': Colors.teal
            },
          ];
        }else{
          menuItems = [
            {'icon': Icons.person, 'label': 'Profile', 'color': Colors.blue},
            {
              'icon': Icons.payment,
              'label': 'Fee Payment',
              'color': Colors.deepPurple
            },
            {'icon': Icons.grade, 'label': 'Exam Result', 'color': Colors.pink},
            {
              'icon': Icons.notifications,
              'label': 'Notice',
              'color': Colors.purple
            },
            {
              'icon': Icons.calendar_today,
              'label': 'Class Routine',
              'color': Colors.green
            },
            {
              'icon': Icons.email,
              'label': 'Message',
              'color': Colors.blueAccent
            },
            {
              'icon': Icons.card_giftcard,
              'label': 'Holiday',
              'color': Colors.red
            },
            {
              'icon': Icons.home_work,
              'label': 'Homework',
              'color': Colors.orange
            },
            {
              'icon': Icons.library_books,
              'label': 'Library',
              'color': Colors.purple
            },
            {
              'icon': Icons.qr_code_scanner,
              'label': 'QR Scanner',
              'color': Colors.teal
            },
          ];
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(AppData.School_name, style: TextStyle(color: Colors.white, fontSize: 20)),
            backgroundColor: AppColor.primaryColor,
            iconTheme: IconThemeData(
              color: Colors.white, // 👈 Change this to any color you want
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.refresh),
                tooltip: 'Refresh Balance',
                onPressed: () async {
                  await _refreshBalance(context);
                },
              ),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(color: AppColor.primaryColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, size: 40, color: AppColor.primaryColor),
                      ),
                      SizedBox(height: 10),
                      Text(firstUser != null ? firstUser['full_name'] : 'User Name', style: TextStyle(color: Colors.white, fontSize: 18)),
                      Text( firstUser != null ? firstUser['email'] :'user@example.com', style: TextStyle(color: Colors.white70,fontSize: 14)),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.dashboard),
                  title: Text('Dashboard'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                  onTap: () {
                    _logout(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Refresh'),
                  onTap: () {
                    refresh(context);
                  },
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _recommendedProductListView(context),
                  _neumorphicButton("Pay School Fees", () async {
                    final prefs = await SharedPreferences.getInstance();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MakePayment(prefs.getString('code_number')!),
                      ),
                    );
                  }),
                  SizedBox(height: 8,),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: menuItems.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Handle menu item navigation
                          if(menuItems[index]['label']=='Profile'){
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (context) => StudentProfileScreen()));
                          }else if(menuItems[index]['label']=='Class Routine'){
                            // Navigator.pushReplacement(
                            //     context, MaterialPageRoute(builder: (context) => ClassTimetableScreen()));
                          }
                          else if(menuItems[index]['label']=='Upload Result'){
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (context) => ExamListScreen()));
                          }
                          else if(menuItems[index]['label']=='Message'){
                            // Navigator.pushReplacement(
                            //     context, MaterialPageRoute(builder: (context) => ChatScreen()));
                          }
                          else if(menuItems[index]['label']=='Exam Result'){
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (context) => ExamResultScreen()));
                          }
                          else if(menuItems[index]['label']=='Attendance'){
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (context) => AttendanceScreen()));
                          }
                          else if(menuItems[index]['label']=='Notice'){
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (context) => NoticeScreen()));
                          }
                          else if(menuItems[index]['label']=='Payment List'){
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (context) => FeesPaymentListScreen()));
                          }
                          else if(menuItems[index]['label']=='Holiday'){
                            // Navigator.pushReplacement(
                            //     context, MaterialPageRoute(builder: (context) => HolidayScreen()));
                          }
                          else if(menuItems[index]['label']=='Homework'){
                            // Navigator.pushReplacement(
                            //     context, MaterialPageRoute(builder: (context) => AttendanceScreen()));
                          }
                          else if(menuItems[index]['label']=='Fee Payment'){
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (context) => FeePaymentHistoryScreen()));
                          }
                          else if(menuItems[index]['label']=='Library'){
                            // Navigator.pushReplacement(
                            //     context, MaterialPageRoute(builder: (context) => LibraryScreen()));
                          }
                          else if(menuItems[index]['label']=='QR Scanner'){
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => QrCodeScannerScreen())
                            );
                          }
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Neumorphic Circle Container with embossed effect
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                color: menuItems[index]['color'],
                                shape: BoxShape.circle,

                                // Embossed neumorphic shadows
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.7),  // light highlight (top-left)
                                    offset: Offset(-5, -5),
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                  ),
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),  // dark shadow (bottom-right)
                                    offset: Offset(5, 5),
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              child: Icon(
                                menuItems[index]['icon'],
                                size: 35,
                                color: Colors.white,
                              ),
                            ),

                            const SizedBox(height: 8),

                            // Label text with a subtle shadow for slight depth
                            Text(
                              menuItems[index]['label'],
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[800],
                                shadows: [
                                  Shadow(
                                    color: Colors.white.withOpacity(0.6),
                                    offset: Offset(0, 1),
                                    blurRadius: 1,
                                  ),
                                ],
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
          ),
        );
      },
    );
  }

  Future<void> _logout(BuildContext context) async {
     await DatabaseHelper.instance.logOutUser();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );

  }

  Future<void> refresh(BuildContext context) async {
    // Existing full refresh logic remains unchanged
    // ...
  }

  Future<void> _refreshBalance(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(
        child: CircularProgressIndicator(color: AppColor.primaryColor,),
      ),
    );
    try {
      final prefs = await SharedPreferences.getInstance();
      final studentId = prefs.getString('code_number');
      if (studentId == null) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No student selected.')),
        );
        return;
      }
      final url = Uri.parse(AppData.url + '/balance_update');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': studentId}),
      );
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        print(responseBody);
        final feesAssignStudent = responseBody['data']['feesAssignChildren'];
        final transactions = responseBody['data']['transactions'];
        final studentData = responseBody['data']['student'];

        if (studentData is List) {
          await DatabaseHelper.instance.deleteFeesAssignmentsForStudents(
            studentData.map((s) => s['id']),
          );
        }
        for(var feesAssign in feesAssignStudent ) {
          await DatabaseHelper.instance.insertFeesAssignment(feesAssign);
        }
        await DatabaseHelper.instance.saveFeesSummary(responseBody['data']['feesSummary']);

        for (var transaction in transactions) {
          await DatabaseHelper.instance.insertFeeTransactions(transaction);
        }

        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Balance updated successfully.')),
        );
        // Reload DashboardScreen to update displayed details
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        );
      } else {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update balance.')),
        );
      }
    } catch (e) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating balance.')),
      );
    }
  }

}

class StudentCardWidget extends StatefulWidget {
  final List<Map<String, dynamic>> students;
  final String roleId;

  const StudentCardWidget({required this.students, required this.roleId, super.key});

  @override
  State<StudentCardWidget> createState() => _StudentCardWidgetState();
}

class _StudentCardWidgetState extends State<StudentCardWidget> {
  late Map<String, dynamic> selectedStudent;

  @override
  void initState() {
    super.initState();
    selectedStudent = widget.students.first;
    _saveCurrentStudent();
  }

  Future<void> _saveCurrentStudent() async {
    print(widget.students.first['id'].toString());
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('current_student', widget.students.first['id'].toString());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5, left: 5),
      child: Stack(
        children: [
          Container(
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColor.primaryColor,
                  AppColor.lightOrange,
                  AppColor.primaryColor,
                ],
              ),
              image: DecorationImage(
                image: AssetImage(Assets.imagesNalopa),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.08),
                  BlendMode.dstATop,
                ),
              ),

              // ----------- NEUMORPHIC STYLES -----------

              // For Embossed (Raised) effect, use outer shadows:
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.7), // highlight on top-left
                  offset: Offset(-6, -6),
                  blurRadius: 12,
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.25), // shadow on bottom-right
                  offset: Offset(6, 6),
                  blurRadius: 12,
                  spreadRadius: 1,
                ),
              ],

              // For Sunken (Inset) effect, comment above and uncomment below:
              /*
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3), // inner shadow bottom-right
              offset: Offset(6, 6),
              blurRadius: 10,
              inset: true,  // requires flutter_inner_shadow or similar package
            ),
            BoxShadow(
              color: Colors.white.withOpacity(0.6), // inner highlight top-left
              offset: Offset(-6, -6),
              blurRadius: 10,
              inset: true,
            ),
          ],
          */

            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      selectedStudent['full_name'] ?? 'Student Name',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 4),
                    widget.roleId != '7'
                        ? const SizedBox(height: 4)
                        : Text(
                      "${selectedStudent['class_name']} (${selectedStudent['section_name']})" ?? "Standard Two (B)",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    widget.roleId != '7'
                        ? const SizedBox(height: 4)
                        : Text(
                      "Remained : TZS ${NumberFormat('#,##0').format(double.parse(selectedStudent['remained_amount'].toString()))}",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Dropdown in the top-left corner
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton<Map<String, dynamic>>(
                value: selectedStudent,
                underline: SizedBox(),
                iconEnabledColor: Colors.black,
                onChanged: (Map<String, dynamic>? newStudent) async {
                  if (newStudent != null) {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setString('current_student', newStudent['id'].toString());
                    setState(() {
                      selectedStudent = newStudent;
                    });
                  }
                },
                items: widget.students.map((student) {
                  return DropdownMenuItem<Map<String, dynamic>>(
                    value: student,
                    child: Text(
                      student['first_name'],
                      style: const TextStyle(fontSize: 12),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );

  }
}






