class Message {
  final String id;
  final String content;
  final String sender;
  final DateTime timestamp;
  final bool isUnread;

  Message({
    required this.id,
    required this.content,
    required this.sender,
    this.isUnread = true,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  // Method لإنشاء نسخة محدثة من الكائن
  Message copyWith({
    String? id,
    String? content,
    String? sender,
    bool? isUnread,
    DateTime? timestamp,
  }) {
    return Message(
      id: id ?? this.id,
      content: content ?? this.content,
      sender: sender ?? this.sender,
      isUnread: isUnread ?? this.isUnread,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
