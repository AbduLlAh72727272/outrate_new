// models/user_model.dart
class UserModel {
  final int id;
  final String email;
  final String username;
  final String fullName;
  final String? gender;
  final String? bio;
  final String country;
  final double? rating;
  final String isVerified;
  final String profilePicUrl;
  final String status;
  final int followersCount;
  final int followingCount;

  UserModel({
    required this.id,
    required this.email,
    required this.username,
    required this.fullName,
    this.gender,
    this.bio,
    required this.country,
    this.rating,
    required this.isVerified,
    required this.profilePicUrl,
    required this.status,
    required this.followersCount,
    required this.followingCount,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      fullName: json['full_name'],
      gender: json['gender'],
      bio: json['bio'],
      country: json['country'],
      rating: json['rating'] != null ? json['rating'].toDouble() : null,
      isVerified: json['isVerified'],
      profilePicUrl: json['profile_pic_url'],
      status: json['status'],
      followersCount: json['followers_count'],
      followingCount: json['following_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'full_name': fullName,
      'gender': gender,
      'bio': bio,
      'country': country,
      'rating': rating,
      'isVerified': isVerified,
      'profile_pic_url': profilePicUrl,
      'status': status,
      'followers_count': followersCount,
      'following_count': followingCount,
    };
  }
}
