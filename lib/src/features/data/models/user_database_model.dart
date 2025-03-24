import 'dart:convert';

class UserDatabaseModel {
  final String fullName;
  final String username;
  final DateTime birthDate;
  final String password;
  final String gender;      
  final String? character; // ✅ Bisa null sekarang

  UserDatabaseModel({
    required this.fullName,
    required this.username,
    required this.birthDate,
    required this.password,
    required this.gender,
    this.character, // ✅ Tidak wajib diisi
  });

  // ✅ Konversi ke JSON
  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "username": username,
        "birthDate": birthDate.toIso8601String(),
        "password": password,
        "gender": gender,
        "character": character, // ✅ Bisa null
      };

  // ✅ Konversi dari JSON
  factory UserDatabaseModel.fromJson(Map<String, dynamic> json) {
    return UserDatabaseModel(
      fullName: json["fullName"],
      username: json["username"],
      birthDate: DateTime.parse(json["birthDate"]),
      password: json["password"],
      gender: json["gender"],
      character: json["character"], // ✅ Bisa null
    );
  }

  // ✅ Konversi dari JSON String
  static UserDatabaseModel fromJsonString(String jsonString) {
    return UserDatabaseModel.fromJson(json.decode(jsonString));
  }

  // ✅ Konversi ke JSON String
  String toJsonString() => json.encode(toJson());

  // ✅ Copy dengan data baru
  UserDatabaseModel copyWith({
    String? fullName,
    String? username,
    DateTime? birthDate,
    String? password,
    String? gender,
    String? character,
  }) {
    return UserDatabaseModel(
      fullName: fullName ?? this.fullName,
      username: username ?? this.username,
      birthDate: birthDate ?? this.birthDate,
      password: password ?? this.password,
      gender: gender ?? this.gender,
      character: character ?? this.character, // ✅ Bisa null
    );
  }
}
