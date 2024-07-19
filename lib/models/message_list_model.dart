class MessageListModel {
  final String name;
  final String message;
  final String time;
  final String avatar;
  final bool isOnline;
  final int unreadMessages;

  MessageListModel({
    required this.name,
    required this.message,
    required this.time,
    required this.avatar,
    required this.isOnline,
    required this.unreadMessages,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'message': message,
      'time': time,
      'avatar': avatar,
      'isOnline': isOnline,
      'unreadMessages': unreadMessages,
    };
  }

  factory MessageListModel.fromMap(Map<String, dynamic> map) {
    return MessageListModel(
      name: map['name'] as String,
      message: map['message'] as String,
      time: map['time'] as String,
      avatar: map['avatar'] as String,
      isOnline: map['isOnline'] as bool,
      unreadMessages: map['unreadMessages'] as int,
    );
  }
}
