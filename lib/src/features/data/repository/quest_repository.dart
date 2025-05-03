import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/helper/global.dart';
import '../models/quest_model.dart';

class QuestRepository {
  Future<List<QuestModel>> fetchQuestList({
    required int page,
    required int pageSize,
  }) async {
    final response = await http.get(Uri.parse(
        '$baseAPI/api/mock/quest?page=$page&pageSize=$pageSize'));

    if (response.statusCode == 200) {
      // Menampilkan response.body sebelum parsing
      print('Response Body: ${response.body}');

      final data = jsonDecode(response.body);

      // Menampilkan data setelah parsing
      print('Decoded Data: $data');

      // Cek apakah key 'mockMateri' ada di dalam response
      if (data['mockMateri'] != null) {
        final List quests = data['mockMateri'];
        return quests.map((e) => QuestModel.fromJson(e)).toList();
      } else {
        throw Exception('Key "mockMateri" not found in the response');
      }
    } else {
      throw Exception('Failed to load quest');
    }
  }
}
