class ChatMessageEntity {
  String id;
  String text;
  int createdAt;
  Author author;
  String? imageUrl;

  ChatMessageEntity({
    required this.id,
    required this.createdAt,
    required this.text,
    required this.author,
    this.imageUrl});

  factory ChatMessageEntity.fromJson(Map<String, dynamic> json) {
    return ChatMessageEntity(
        id: json['id'],
        createdAt: json['createdAt'],
        text: json['text'],
        imageUrl: json['image'],
        author: Author.fromJson(json['author']));
  }
}

class Author {
  String username;

  Author({required this.username});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(username: json['username']);
  }
}