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

  Message copyWith({
    String? id,
    String? content,
    String? sender,
    DateTime? timestamp,
    bool? isUnread,
  }) {
    return Message(
      id: id ?? this.id,
      content: content ?? this.content,
      sender: sender ?? this.sender,
      timestamp: timestamp ?? this.timestamp,
      isUnread: isUnread ?? this.isUnread,
    );
  }
}
