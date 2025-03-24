import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static const String keyFullName = "fullName";
  static const String keyUsername = "username";
  static const String keyBirthDate = "birthDate";
  static const String keyPassword = "password";
  static const String keyGender = "gender";
  static const String keyCharacter = "character";

  // Simpan data ke SharedPreferences
  static Future<void> saveUserData({
    required String fullName,
    required String username,
    required DateTime birthDate,
    required String password,
    required String gender,
    required String character,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyFullName, fullName);
    await prefs.setString(keyUsername, username);
    await prefs.setString(keyBirthDate, birthDate.toIso8601String());
    await prefs.setString(keyPassword, password);
    await prefs.setString(keyGender, gender);
    await prefs.setString(keyCharacter, character);
  }

  // Baca data dari SharedPreferences
  static Future<Map<String, String?>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      keyFullName: prefs.getString(keyFullName),
      keyUsername: prefs.getString(keyUsername),
      keyBirthDate: prefs.getString(keyBirthDate),
      keyPassword: prefs.getString(keyPassword),
      keyGender: prefs.getString(keyGender),
      keyCharacter: prefs.getString(keyCharacter),
    };
  }

  // Hapus data dari SharedPreferences
  static Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
