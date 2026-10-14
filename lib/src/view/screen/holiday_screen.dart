import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'menu_screen.dart';


class HolidayScreen extends StatefulWidget {
  @override
  _HolidayScreenState createState() => _HolidayScreenState();
}

class _HolidayScreenState extends State<HolidayScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Dummy holiday data
  final List<Map<String, dynamic>> holidays = [
    {
      "title": "New Year's Day",
      "date": "2025/01/01",
      "description": "Public Holiday",
      "icon": Icons.cake,
      "color": Colors.red
    },
    {
      "title": "Easter Sunday",
      "date": "2025/04/20",
      "description": "Religious Holiday",
      "icon": Icons.church,
      "color": Colors.blue
    },
    {
      "title": "Labour Day",
      "date": "2025/05/01",
      "description": "International Workers' Day",
      "icon": Icons.work,
      "color": Colors.green
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Holidays"),
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => DashboardScreen()));
          },
        ),
        actions: [
          IconButton(icon: Icon(Icons.grid_view_rounded), onPressed: () {}),
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.notifications, color: Colors.white),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: CircleAvatar(
                  radius: 7,
                  backgroundColor: Colors.red,
                  child: Text(
                    "3",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
        ],
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

            // Holiday List
            Expanded(
              child: ListView.builder(
                itemCount: holidays.length,
                itemBuilder: (context, index) {
                  return HolidayCard(
                    title: holidays[index]["title"],
                    date: holidays[index]["date"],
                    description: holidays[index]["description"],
                    icon: holidays[index]["icon"],
                    color: holidays[index]["color"],
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

// Holiday Card Widget
class HolidayCard extends StatelessWidget {
  final String title;
  final String date;
  final String description;
  final IconData icon;
  final Color color;

  HolidayCard({required this.title, required this.date, required this.description, required this.icon, required this.color});

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
        subtitle: Text("$date\n$description"),
        isThreeLine: true,
      ),
    );
  }
}
