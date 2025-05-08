import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mathgasing_v1/src/core/helper/global.dart';
import '../models/subject_matter_model.dart';

class SubjectMatterRepository {
  Future<SubjectMatterModel> fetchSubjectMatter(int idLessonQuest) async {
    final response = await http.get(Uri.parse('$baseAPI/api/mock/quest/subject-matter?id_lesson_quest=$idLessonQuest'));

    if (response.statusCode == 200) {
      final jsonResult = jsonDecode(response.body);
      final videoPembelajaran = jsonResult['video_pembelajaran'];

      if (videoPembelajaran != null && videoPembelajaran.isNotEmpty) {
        return SubjectMatterModel.fromJson(videoPembelajaran[0]);
      } else {
        throw Exception('Data materi tidak ditemukan');
      }
    } else {
      throw Exception('Gagal mengambil data subject matter');
    }
  }
}
