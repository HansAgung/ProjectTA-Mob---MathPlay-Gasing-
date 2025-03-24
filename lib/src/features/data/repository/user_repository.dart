import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:mathgasing_v1/src/features/data/models/user_model.dart';

class UserRepository {
  List<UserModel> _users = [];

  UserRepository() {
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      final String response =
          await rootBundle.loadString('lib/src/features/data/datasources/user_data.json');
      final List<dynamic> data = json.decode(response);
      _users = data.map((json) => UserModel.fromJson(json)).toList();
    } catch (e) {
      print("Error loading user data: $e");
    }
  }

  // Mengecek apakah email terdaftar
  bool isEmailRegistered(String email) {
    return _users.any((user) => user.email == email);
  }

  // Mengecek apakah email dan password cocok
  bool isUserValid(String email, String password) {
    return _users.any((user) => user.email == email && user.password == password);
  }
}
