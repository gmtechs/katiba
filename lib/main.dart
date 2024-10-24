import 'package:flutter/material.dart';
import 'package:katiba/screens/home_screen.dart'; // Import the HomeScreen
import 'package:katiba/screens/chapter_screen.dart'; // Import the ChapterScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Screen Example',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(), // Main entry point for the app
    );
  }
}

class HomePage extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.filter_list, color: Colors.white),
                onPressed: () {
                  // Add filter logic here
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Filter Options'),
                        content: Text('Filter functionality here.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              Expanded(
                child: Container(
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: "Search...",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) {
                      // Handle search logic here
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.green[800],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(8.0),
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              children: [
                CustomGridButton(
                  text: 'The Constitution',
                  color: Colors.green,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChapterScreen()), // Navigate to ChapterScreen
                    );
                  },
                ),
                CustomGridButton(
                  text: 'Standing Orders',
                  color: Colors.green,
                  onPressed: () {
                    // Navigate to Standing Orders screen
                  },
                ),
                CustomGridButton(
                  text: 'Members of Parliament',
                  color: Colors.blue,
                  onPressed: () {
                    // Navigate to Members of Parliament screen
                  },
                ),
                CustomGridButton(
                  text: 'Announcements',
                  color: Colors.orange,
                  onPressed: () {
                    // Navigate to Announcements screen
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'No Notifications',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green[800],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Constitution',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
      ),
    );
  }
}

class CustomGridButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const CustomGridButton({
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
