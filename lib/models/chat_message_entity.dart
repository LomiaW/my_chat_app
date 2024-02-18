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
}

class Author {
  String username;

  Author({required this.username});
}