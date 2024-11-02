class Post {
  final String id;
  final String userId;
  final String text;
  final List<String> imageUrls;
  final String userName;

  Post({
    required this.id,
    required this.userId,
    required this.text,
    required this.imageUrls,
    required this.userName,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'text': text,
      'imageUrls': imageUrls,
      'userName': userName,
    };
  }

  static Post fromMap(Map<String, dynamic> map, String documentId) {
    return Post(
      id: documentId,
      userId: map['userId'],
      text: map['text'],
      imageUrls: List<String>.from(map['imageUrls']),
      userName: map['userName'],
    );
  }
}
