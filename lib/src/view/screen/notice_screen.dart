import 'package:dodomaapp/src/data/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'menu_screen.dart';



class NoticeScreen extends StatefulWidget {
  @override
  _NoticeScreenState createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<Notice> _notices = [];

  @override
  void initState() {
    super.initState();
    fetchNoticesFromLocalDB();
  }

  Future<void> fetchNoticesFromLocalDB() async {
    final db = await DatabaseHelper.instance.database;
    final result = await db.rawQuery('''
      SELECT 
        id,
        title,
        date,
        publish_date,
        REPLACE(REPLACE(description, '<p>', ''), '</p>', '') AS description,
        attachment,
        is_visible_web,
        status,
        visible_to,
        created_at,
        updated_at
      FROM notice_boards
    ''');
    print(result);
    setState(() {
      _notices = result.map((row) => Notice.fromMap(row)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Notice"),
        backgroundColor: Color(0xFFccbd00),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => DashboardScreen()));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Calendar Widget
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: TableCalendar(
                  focusedDay: _focusedDay,
                  firstDay: DateTime(2020),
                  lastDay: DateTime(2030),
                  calendarFormat: CalendarFormat.month,
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                ),
              ),
            ),

            SizedBox(height: 16),

            // Notice List
            Expanded(
              child: _notices.isEmpty
                  ? Center(child: Text("No notices found"))
                  : ListView.builder(
                itemCount: _notices.length,
                itemBuilder: (context, index) {
                  final notice = _notices[index];
                  return NoticeCard(
                    title: notice.title,
                    dateRange: notice.date,
                    description: notice.description,
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

  Notice({
    required this.title,
    required this.date,
    required this.description,
  });

  factory Notice.fromMap(Map<String, dynamic> map) {
    return Notice(
      title: map['title'] ?? '',
      date: map['date'] ?? '',
      description: map['description'] ?? '',
    );
  }
}

// class _NoticeScreenState extends State<NoticeScreen> {
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         title: Text("Notice"),
//         backgroundColor: Color(0xFFccbd00),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pushReplacement(
//                 context, MaterialPageRoute(builder: (context) => DashboardScreen()));
//           },
//         ),
//         actions: [
//
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // Calendar Widget
//             Card(
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//               elevation: 4,
//               child: Padding(
//                 padding: const EdgeInsets.all(12),
//                 child: TableCalendar(
//                   focusedDay: _focusedDay,
//                   firstDay: DateTime(2020),
//                   lastDay: DateTime(2030),
//                   calendarFormat: CalendarFormat.month,
//                   headerStyle: HeaderStyle(
//                     formatButtonVisible: false,
//                     titleCentered: true,
//                   ),
//                   selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//                   onDaySelected: (selectedDay, focusedDay) {
//                     setState(() {
//                       _selectedDay = selectedDay;
//                       _focusedDay = focusedDay;
//                     });
//                   },
//                 ),
//               ),
//             ),
//
//             SizedBox(height: 16),
//
//             // Notice List
//             Expanded(
//               child: ListView(
//                 children: [
//                   NoticeCard(
//                     title: "Notice Weekly",
//                     dateRange: "2024/08/02 to 2025/03/07",
//                     description: "Weekly Notify",
//                     icon: Icons.calendar_today,
//                     color: Colors.green,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Notice Card Widget
class NoticeCard extends StatelessWidget {
  final String title;
  final String dateRange;
  final String description;
  final IconData icon;
  final Color color;

  NoticeCard({required this.title, required this.dateRange, required this.description, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          radius: 25,
          child: Icon(icon, color: Colors.white, size: 30),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("$dateRange\n$description"),
        isThreeLine: true,
      ),
    );
  }
}
