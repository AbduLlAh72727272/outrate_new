// comment_model.dart
class CommentModel {
  final int commentId;
  final int postId;
  final int userId;
  final String comment;
  final DateTime commentTime;

  CommentModel({
    required this.commentId,
    required this.postId,
    required this.userId,
    required this.comment,
    required this.commentTime,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      commentId: json['comment_id'],
      postId: json['post_id'],
      userId: json['user_id'],
      comment: json['comment'],
      commentTime: DateTime.parse(json['comment_time']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'comment_id': commentId,
      'post_id': postId,
      'user_id': userId,
      'comment': comment,
      'comment_time': commentTime.toIso8601String(),
    };
  }
}
