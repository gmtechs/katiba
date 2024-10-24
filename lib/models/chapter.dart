class Chapter {
  final int id;              // Unique identifier for the chapter
  final String title;       // Title of the chapter
  final String description; // Description of the chapter

  Chapter({
    required this.id,
    required this.title,
    required this.description,
  });

  // Method to convert JSON to Chapter object
  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }

  // Method to convert Chapter object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}
