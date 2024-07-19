// models/leaderboard_model.dart
class LeaderboardModel {
  final int rank;
  final String name;
  final String imagePath;
  final String rating;

  LeaderboardModel({
    required this.rank,
    required this.name,
    required this.imagePath,
    required this.rating,
  });

  factory LeaderboardModel.fromJson(Map<String, dynamic> json) {
    return LeaderboardModel(
      rank: json['rank'],
      name: json['name'],
      imagePath: json['imagePath'],
      rating: json['rating'],
    );
  }
}
