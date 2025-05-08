import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mathgasing_v1/src/core/helper/global.dart';
import '../models/option_question_model.dart';

class OptionTestRepository {  
  Future<OptionTestModel> fetchOptionTest() async {
    // Langsung menggunakan baseUrl yang sudah ditentukan
    final response = await http.get(Uri.parse('$baseAPI/api/mock/quest/optionTest'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return OptionTestModel.fromJson(data['optionTest']);
    } else {
      throw Exception('Failed to load option test');
    }
  }
}
