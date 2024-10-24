class Article {
  final int id;                  // Unique identifier for the article
  final String title;           // Title of the article
  final String content;         // Content of the article
  final int chapterId;          // ID of the chapter this article belongs to

  Article({
    required this.id,
    required this.title,
    required this.content,
    required this.chapterId,
  });

  // Method to convert JSON to Article object
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      chapterId: json['chapterId'],
    );
  }

  // Method to convert Article object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'chapterId': chapterId,
    };
  }
}
