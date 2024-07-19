// models/user_model.dart
class UserModel {
  final String id;
  final String name;
  final String username;
  final String bio;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.bio,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      bio: json['bio'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'bio': bio,
    };
  }
}
