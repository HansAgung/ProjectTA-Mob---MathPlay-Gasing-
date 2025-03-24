import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  Future<void> saveUserData({
    required String fullName,
    required String username,
    required String email,
    required String password,
    required String gender,
    required String character,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    
    await prefs.setString('fullName', fullName);
    await prefs.setString('username', username);
    await prefs.setString('email', email);
    await prefs.setString('password', password);
    await prefs.setString('gender', gender);
    await prefs.setString('character', character);
  }

  // 🔹 Method untuk mendapatkan data user
  Future<Map<String, String?>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'fullName': prefs.getString('fullName'),
      'username': prefs.getString('username'),
      'email': prefs.getString('email'),
      'password': prefs.getString('password'),
      'gender': prefs.getString('gender'),
      'character': prefs.getString('character'),
    };
  }
}
