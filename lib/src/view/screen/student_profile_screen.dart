import 'package:dodomaapp/src/view/screen/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/app_color.dart';
import '../../data/database_helper.dart';


class StudentProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<StudentProfileScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Map<String, dynamic>? firstStudent;
  Map<String, dynamic>? firstUser;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _fetchFirstStudent(); // Fetch student data on screen load
  }

  Future<void> _fetchFirstStudent() async {

    List<Map<String, dynamic>> students = await DatabaseHelper.instance.getStudents();
    final prefs = await SharedPreferences.getInstance();
    String? current_student = prefs.getString('current_student');

    if(students.isNotEmpty){
      firstStudent = await DatabaseHelper.instance.getStudentById(int.parse(current_student!));
    }else{
      firstUser = await DatabaseHelper.instance.getFirstUser();
    }

    setState(() {}); // Update the UI with fetched data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text(
          "My Profile",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DashboardScreen()),
            );
          },
        ),
        actions: [

        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.school, size: 50, color: AppColor.primaryColor),
                  ),
                  SizedBox(height: 10),
                  Text(
                    firstStudent != null ? firstStudent!['full_name'] :firstUser != null ? firstUser!['name'] : "Loading...",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  firstStudent != null ? Text(
                    firstStudent != null ? firstStudent!['class_name'] : "Loading...",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ):Text(''),
                ],
              ),
            ),

            // Tab Bar
            Container(
              color: Colors.white,
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: "GENERAL INFO."),
                ],
              ),
            ),

            // TabBar View
            firstStudent != null ? _buildParentInfoCard(firstStudent)
                :
            _buildParentInfoUser(firstUser),

          ],
        ),
      ),
    );
  }

  Widget _buildParentInfoCard(Map<String, dynamic>? student) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            _infoTile(
              icon: Icons.person,
              title: student?['last_name'] ?? 'Loading...',
              subtitle: 'Guardian Name',
            ),
            Divider(),
            _infoTile(
              icon: Icons.phone,
              title: student?['guardian_mobile'] ?? 'Loading...',
              subtitle: 'Mobile Number',
            ),
            Divider(),
            _infoTile(
              icon: Icons.class_,
              title: student?['class_name'] ?? 'Loading...',
              subtitle: 'Class',
            ),
            if (student?['section_name'] != null) Divider(),
            if (student?['section_name'] != null)
              _infoTile(
                icon: Icons.view_array_outlined,
                title: student?['section_name'],
                subtitle: 'Section',
              ),
            if (student?['guardian_email'] != null) Divider(),
            if (student?['guardian_email'] != null)
              _infoTile(
                icon: Icons.email,
                title: 'Email',
                subtitle: student?['guardian_email'],
              ),
            if (student?['father_name'] != null) Divider(),
            if (student?['father_name'] != null)
              _infoTile(
                icon: Icons.person,
                title: 'Father',
                subtitle: student?['father_name']+': :'+student?['father_mobile'],
              ),
            if (student?['mother_name'] != null) Divider(),
            if (student?['mother_name'] != null)
              _infoTile(
                icon: Icons.person,
                title: 'Mother',
                subtitle: student?['mother_name']+': :'+student?['mother_mobile'],
              ),
          ],
        ),
      ),
    );
  }


  Widget _buildParentInfoUser(Map<String, dynamic>? student) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            _infoTile(
              icon: Icons.person,
              title: student?['name'] ?? 'Loading...',
              subtitle: 'User Name',
            ),
            Divider(),
            _infoTile(
              icon: Icons.phone,
              title: student?['mobile'] ?? '',
              subtitle: 'Mobile Number',
            ),
            Divider(),
            _infoTile(
              icon: Icons.class_,
              title: student?['email'] ?? 'Loading...',
              subtitle: 'Email',
            ),

          ],
        ),
      ),
    );
  }

  Widget _infoTile({required IconData icon, required String title, required String subtitle}) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: Icon(icon, size: 28, color: AppColor.primaryColor),
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(subtitle),
    );
  }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
