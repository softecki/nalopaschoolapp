import 'package:flutter/material.dart';

import '../../../core/app_color.dart';
import 'menu_screen.dart';

// Model for each timetable entry
class TimetableEntry {
  final String subjectCode;
  final String subjectName;
  final String roomNumber;
  final String startTime;
  final String endTime;

  TimetableEntry({
    required this.subjectCode,
    required this.subjectName,
    required this.roomNumber,
    required this.startTime,
    required this.endTime,
  });
}

class ClassTimetableScreen extends StatefulWidget {
  @override
  _ClassTimetableScreenState createState() => _ClassTimetableScreenState();
}

class _ClassTimetableScreenState extends State<ClassTimetableScreen> {
  // List of days of the week
  final List<String> days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
  int selectedDayIndex = 1; // Monday is selected by default (index 1)

  // Sample timetable data for Monday
  final List<TimetableEntry> timetableEntries = [
    TimetableEntry(
      subjectCode: "SCI",
      subjectName: "Science",
      roomNumber: "112",
      startTime: "04:29 PM",
      endTime: "05:29 PM",
    ),
    TimetableEntry(
      subjectCode: "SCI",
      subjectName: "Science",
      roomNumber: "112",
      startTime: "04:29 PM",
      endTime: "05:29 PM",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => DashboardScreen()));
          },
        ),
        title: Text("Class Timetable"),
        backgroundColor: AppColor.primaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification button press
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Section Selector
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_left),
                  onPressed: () {
                    // Handle previous class/section
                  },
                ),
                Text(
                  "STD: Class 2-No Section",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_right),
                  onPressed: () {
                    // Handle next class/section
                  },
                ),
              ],
            ),
          ),
          // Day Tabs
          Container(
            height: 50.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: days.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDayIndex = index;
                      // Update timetableEntries based on the selected day
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: selectedDayIndex == index ? AppColor.primaryColor : Colors.transparent,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Text(
                        days[index],
                        style: TextStyle(
                          color: selectedDayIndex == index ? Colors.white : Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Timetable List
          Expanded(
            child: ListView.builder(
              itemCount: timetableEntries.length,
              itemBuilder: (context, index) {
                final entry = timetableEntries[index];
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
                          // Colored square with subject code
                          Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Center(
                              child: Text(
                                entry.subjectCode,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 16.0),
                          // Subject name, room, and time
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${entry.subjectName}-${entry.roomNumber}",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      size: 16.0,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(width: 4.0),
                                    Text(
                                      "${entry.startTime} - ${entry.endTime}",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

