// chapter_screen.dart
import 'package:flutter/material.dart';
import '../article_screen.dart';
import '../services/article_service.dart';
import 'article_screen.dart';

class ChapterScreen extends StatelessWidget {
  final ArticleService articleService = ArticleService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapters'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Map<String, String>>>(
        future: _loadChapterTitles(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No chapters found.'));
          }

          final chapters = snapshot.data!;

          return RefreshIndicator(
            onRefresh: _loadChapterTitles,
            child: ListView.builder(
              itemCount: chapters.length,
              itemBuilder: (context, index) {
                final chapterId = index + 1; // Chapter IDs are 1-based
                final chapterTitle = chapters[index]['title'] ?? 'Chapter $chapterId';

                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  elevation: 4,
                  child: ListTile(
                    leading: Icon(Icons.book, color: Theme.of(context).primaryColor),
                    title: Text(
                      chapterTitle,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('View Articles', style: TextStyle(color: Colors.grey)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArticleScreen(chapterId: chapterId),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Future<List<Map<String, String>>> _loadChapterTitles() async {
    List<Map<String, String>> chapters = [];
    try {
      for (int i = 1; i <= 18; i++) { // Explicitly handling all 18 chapters
        final chapterData = await articleService.getChapter(i);
        print("Fetched Chapter $i: $chapterData"); // Debugging line

        if (chapterData != null) {
          final title = chapterData['title'] as String?;
          chapters.add({'id': i.toString(), 'title': title ?? 'Chapter $i'});
        } else {
          print("Chapter $i JSON is null.");
        }
      }
    } catch (e) {
      print("Error loading chapters: $e");
    }

    print("Total Chapters Loaded: ${chapters.length}"); // Debugging line
    return chapters;
  }
}