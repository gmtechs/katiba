// lib/services/article_service.dart
import 'dart:convert';
import 'package:flutter/services.dart';

class ArticleService {
  Future<Map<String, dynamic>> getChapter(int chapterId) async {
    // Load JSON file from assets folder based on chapterId
    final String response = await rootBundle.loadString('assets/chapter_$chapterId.json');
    return jsonDecode(response);
  }
}
