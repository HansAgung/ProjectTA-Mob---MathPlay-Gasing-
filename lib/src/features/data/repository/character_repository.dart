import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/character_model.dart';

class CharacterRepository {
  Future<List<CharacterModel>> fetchCharacters() async {
    final String response =
        await rootBundle.loadString('lib/src/features/data/datasources/character_user_data.json');
    final data = json.decode(response);
    return (data['characters'] as List)
        .map((char) => CharacterModel.fromJson(char))
        .toList();
  }
}
