class Note {
  final int? id;
  final String title;
  final String content;
  final String category;
  final bool isFavorite;
  final String createdAt;

  Note({
    this.id,
    required this.title,
    required this.content,
    required this.category,
    required this.isFavorite,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'category': category,
      'isFavorite': isFavorite ? 1 : 0,
      'createdAt': createdAt,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      category: map['category'],
      isFavorite: map['isFavorite'] == 1,
      createdAt: map['createdAt'],
    );
  }
}
