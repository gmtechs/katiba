import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/chapter.dart';

class ChapterService {
  // Method to load chapters from the JSON file
  Future<List<Chapter>> loadChapters() async {
    // Load the JSON file from assets
    final String response = await rootBundle.loadString('assets/constitution.json');
    final data = json.decode(response);

    // Parse chapters from JSON data
    List<Chapter> chapters = (data['chapters'] as List)
        .map((chapter) => Chapter.fromJson(chapter))
        .toList();

    return chapters;
  }

  getChapters() {}
}
