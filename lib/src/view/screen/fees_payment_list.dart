import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/database_helper.dart';
import 'menu_screen.dart';

class FeesPaymentListScreen extends StatefulWidget {
  @override
  _FeesPaymentListScreenState createState() => _FeesPaymentListScreenState();
}

class _FeesPaymentListScreenState extends State<FeesPaymentListScreen> {
  List<Notice> _notices = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchNoticesFromLocalDB();
  }

  Future<void> fetchNoticesFromLocalDB({String? searchName}) async {
    final db = await DatabaseHelper.instance.database;

    String baseQuery = '''
      SELECT 
        fees_assign_children.*, students_list.first_name, students_list.last_name
      FROM fees_assign_children 
      INNER JOIN students_list ON students_list.id = fees_assign_children.student_id
    ''';

    if (searchName != null && searchName.trim().isNotEmpty) {
      baseQuery += " WHERE students_list.first_name LIKE '%$searchName%' OR students_list.last_name LIKE '%$searchName%'";
    }

    final result = await db.rawQuery(baseQuery);
    setState(() {
      _notices = result.map((row) => Notice.fromMap(row)).toList();
    });
  }

  void _search() {
    fetchNoticesFromLocalDB(searchName: _searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Fees Payment List"),
        backgroundColor: Color(0xFFccbd00),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DashboardScreen()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Search Input
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Enter student name...',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _search,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                  child: Text("Search"),
                ),
              ],
            ),

            SizedBox(height: 16),

            // Notice List
            Expanded(
              child: _notices.isEmpty
                  ? Center(child: Text("No data found"))
                  : ListView.builder(
                itemCount: _notices.length,
                itemBuilder: (context, index) {
                  final notice = _notices[index];
                  return PaymentCard(
                    title: notice.title,
                    dateRange: notice.date,
                    description: notice.description,
                    remained: notice.remained,
                    icon: Icons.notifications,
                    color: Colors.orange,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Notice {
  final String title;
  final String date;
  final String description;
  final String remained;

  Notice({
    required this.title,
    required this.date,
    required this.description,
    required this.remained,
  });

  factory Notice.fromMap(Map<String, dynamic> map) {
    return Notice(
      title: map['first_name'] ?? '',
      date: map['last_name'] ?? '',
      description: map['fees_amount']?.toString() ?? '0',
      remained: map['remained_amount']?.toString() ?? '0',
    );
  }
}

class PaymentCard extends StatelessWidget {
  final String title;
  final String dateRange;
  final String description;
  final String remained;
  final IconData icon;
  final Color color;

  PaymentCard({
    required this.title,
    required this.dateRange,
    required this.description,
    required this.remained,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          radius: 15,
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        title: Text(
          "$title $dateRange",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Fees:", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(double.parse(description).round().toString()),
            Text("Remained:", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(double.parse(remained).round().toString()),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}

// class FeesPaymentListScreen extends StatefulWidget {
//   @override
//   _FeesPaymentListScreenState createState() => _FeesPaymentListScreenState();
// }
//
// class _FeesPaymentListScreenState extends State<FeesPaymentListScreen> {
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;
//   List<Notice> _notices = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchNoticesFromLocalDB();
//   }
//
//   Future<void> fetchNoticesFromLocalDB() async {
//     final db = await DatabaseHelper.instance.database;
//     final result = await db.rawQuery('''
//       SELECT
//         fees_assign_children.*,students_list.first_name,students_list.last_name
//       FROM fees_assign_children
//       INNER JOIN students_list ON students_list.id = fees_assign_children.student_id
//     ''');
//     print(result);
//     setState(() {
//       _notices = result.map((row) => Notice.fromMap(row)).toList();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         title: Text("Fees Payment List"),
//         backgroundColor: Color(0xFFccbd00),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pushReplacement(
//                 context, MaterialPageRoute(builder: (context) => DashboardScreen()));
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//
//             SizedBox(height: 16),
//
//             // Notice List
//             Expanded(
//               child: _notices.isEmpty
//                   ? Center(child: Text("No notices found"))
//                   : ListView.builder(
//                 itemCount: _notices.length,
//                 itemBuilder: (context, index) {
//                   final notice = _notices[index];
//                   return PaymentCard(
//                     title: notice.title,
//                     dateRange: notice.date,
//                     description: notice.description,
//                     remained:notice.remained,
//                     icon: Icons.notifications,
//                     color: Colors.orange,
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// class Notice {
//   final String title;
//   final String date;
//   final String description;
//   final String remained;
//
//   Notice({
//     required this.title,
//     required this.date,
//     required this.description,
//     required this.remained,
//   });
//
//   factory Notice.fromMap(Map<String, dynamic> map) {
//     return Notice(
//       title: map['first_name'] ?? '',
//       date: map['last_name'] ?? '',
//       description: map['fees_amount'] ?? '',
//       remained: map['remained_amount'] ?? '',
//     );
//   }
// }
//
// class PaymentCard extends StatelessWidget {
//   final String title;
//   final String dateRange;
//   final String description;
//   final String remained;
//   final IconData icon;
//   final Color color;
//
//   PaymentCard({required this.title, required this.dateRange, required this.description,required this.remained, required this.icon, required this.color});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 4),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       child: ListTile(
//         leading: CircleAvatar(
//           backgroundColor: color,
//           radius: 15,
//           child: Icon(icon, color: Colors.white, size: 20),
//         ),
//         title: Text(title + " "+dateRange, style: TextStyle(fontWeight: FontWeight.bold)),
//         subtitle: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Text(
//               "Fees",
//               style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               double.parse(description).round().toString(),
//               style: TextStyle(fontSize: 14, color: Colors.black87),
//             ),
//             Text(
//               "Remained",
//               style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               double.parse(remained).round().toString(),
//               style: TextStyle(fontSize: 14, color: Colors.black87),
//             ),
//           ],
//         ),
//         isThreeLine: true,
//       ),
//     );
//   }
// }
