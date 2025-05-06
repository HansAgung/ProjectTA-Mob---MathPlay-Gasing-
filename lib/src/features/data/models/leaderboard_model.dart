class LeaderboardModel {
  final String username;
  final int points;

  LeaderboardModel({
    required this.username,
    required this.points,
  });

  factory LeaderboardModel.fromJson(Map<String, dynamic> json) {
    return LeaderboardModel(
      username: json['username'] ?? '',
      points: json['points'] ?? 0,
    );
  }
} 