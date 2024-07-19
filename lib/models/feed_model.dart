// models/feed_model.dart
class FeedModel {
  final String name;
  final String username;
  final String profileImageUrl;
  final List<String> imageUrls;
  final int likeCount;
  final int commentCount;
  FeedModel({
    required this.name,
    required this.username,
    required this.profileImageUrl,
    required this.imageUrls,
    required this.likeCount,
    required this.commentCount,
  });

  factory FeedModel.fromJson(Map<String, dynamic> json) {
    // return FeedModel(
    //   name: json['title'],
    //   username: json['post_username'],
    //   profileImageUrl: json['profileImageUrl'],
    //   imageUrls: List<String>.from(json['imageUrls']),
    //   likeCount: json['likeCount'],
    //   commentCount: json['commentCount'],
    //   isVerified: json['isVerified'],
    // );

    return FeedModel(
      name: json['user']['full_name'],
      username: json['user']['username'],
      profileImageUrl: json['user']['profile_pic_url'],
      imageUrls: List<String>.from(json['content']),
      likeCount: json['average_rating'],
      commentCount: json['comment_count'],);
  }
}