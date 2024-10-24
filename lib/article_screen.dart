// lib/pages/article_screen.dart
import 'package:flutter/material.dart';
import 'package:katiba/screens/article_screen.dart';
import '../services/article_service.dart'; // Import the ArticleService class

class ArticleScreen extends StatelessWidget {
  final int chapterId;
  final ArticleService articleService = ArticleService(); // Create an instance of ArticleService

  ArticleScreen({required this.chapterId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chapter $chapterId Articles')),
      body: FutureBuilder<Map<String, dynamic>>(
        future: articleService.getChapter(chapterId), // Fetch chapter data based on chapterId
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No articles found.'));
          }

          final chapterTitle = snapshot.data!['title'];
          final articles = snapshot.data!['articles'];

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  chapterTitle,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    final article = articles[index];
                    return ExpansionTile(
                      title: Text(article['title']),
                      children: article['content']
                          .map<Widget>((content) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(content),
                      ))
                          .toList(),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
