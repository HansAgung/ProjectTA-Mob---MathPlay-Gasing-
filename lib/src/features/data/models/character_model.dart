class CharacterModel {
  final String nama;
  final String kisah;
  final String motto;
  final String imgPath;

  CharacterModel({
    required this.nama,
    required this.kisah,
    required this.motto,
    required this.imgPath,
  });

  // 🔹 Factory untuk membuat objek dari JSON
  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      nama: json['nama_character'],
      kisah: json['kisah_character'],
      motto: json['character_motto'],
      imgPath: json['character_img'],
    );
  }
}
