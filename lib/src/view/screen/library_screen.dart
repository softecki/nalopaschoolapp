import 'package:flutter/material.dart';

import 'menu_screen.dart';

// Model for each book
class Book {
  final String title;
  final String bookId;
  final String author;

  Book({
    required this.title,
    required this.bookId,
    required this.author,
  });
}

class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  // Segmented control state
  int _selectedSegment = 0; // 0 for "My Books", 1 for "Book List"

  // Sample book data
  final List<Book> myBooks = [
    Book(
      title: "AC",
      bookId: "FNGOSHWE232434",
      author: "Dr Ambedkar",
    ),
    Book(
      title: "Porter",
      bookId: "FNGOSHWE23",
      author: "Harry Potter",
    ),
    Book(
      title: "gvat Gita",
      bookId: "FNGOSHWE23",
      author: "Krishna",
    ),
  ];

  final List<Book> bookList = [
    // Add more books for the "Book List" tab
    Book(
      title: "Book 1",
      bookId: "BOOK123",
      author: "Author 1",
    ),
    Book(
      title: "Book 2",
      bookId: "BOOK456",
      author: "Author 2",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Determine which list to display based on the selected segment
    final List<Book> books = _selectedSegment == 0 ? myBooks : bookList;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => DashboardScreen()));

          },
        ),
        title: Text("Library"),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification button press
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade50, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // Segmented Control
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                child: SegmentedButton<int>(
                  segments: [
                    ButtonSegment<int>(
                      value: 0,
                      label: Text("My Books"),
                    ),
                    ButtonSegment<int>(
                      value: 1,
                      label: Text("Book List"),
                    ),
                  ],
                  selected: {_selectedSegment},
                  onSelectionChanged: (newSelection) {
                    setState(() {
                      _selectedSegment = newSelection.first;
                    });
                  },
                ),
              ),
            ),
            // Book List
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: Card(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            // Green square with book icon
                            Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.book,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ),
                            ),
                            SizedBox(width: 16.0),
                            // Book details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    book.title,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    "(${book.bookId})",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    book.author,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black87,
                                    ),
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
      ),
    );
  }
}

