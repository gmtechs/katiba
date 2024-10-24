import 'package:flutter/material.dart';
import '../services/chapter_service.dart';
import '../models/chapter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Chapter>> chapters;

  @override
  void initState() {
    super.initState();
    ChapterService chapterService = ChapterService();
    chapters = chapterService.loadChapters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Katiba App"),
      ),
      body: FutureBuilder<List<Chapter>>(
        future: chapters,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            final chapters = snapshot.data!;
            return ListView.builder(
              itemCount: chapters.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(chapters[index].title),
                  subtitle: Text(chapters[index].description),
                  onTap: () {
                    // Navigate to chapter screen
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
