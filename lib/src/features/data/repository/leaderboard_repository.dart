import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mathgasing_v1/src/core/helper/global.dart';
import '../models/leaderboard_model.dart';

class LeaderboardRepository {
  Future<List<LeaderboardModel>> fetchLeaderboard() async {
    final response = await http.get(Uri.parse('$baseAPI/api/mock/leaderboard'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> leaderboardData = data['leaderboard'];
      return leaderboardData
          .map((item) => LeaderboardModel.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to fetch leaderboard');
    }
  }
}
