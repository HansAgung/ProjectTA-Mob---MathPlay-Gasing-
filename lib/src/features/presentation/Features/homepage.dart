import 'package:flutter/material.dart';
import 'package:mathgasing_v1/src/features/presentation/Authentication/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mathgasing_v1/src/shared/Utils/app_colors.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String fullName = "";
  String username = "";
  String email = "";
  String birthDate = "";
  String gender = "";
  String character = "";

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      fullName = prefs.getString('fullName') ?? "Tidak ditemukan";
      username = prefs.getString('username') ?? "Tidak ditemukan";
      email = prefs.getString('email') ?? "Tidak ditemukan";
      birthDate = prefs.getString('birthDate') ?? "Tidak ditemukan";
      gender = prefs.getString('gender') ?? "Tidak ditemukan";
      character = prefs.getString('character') ?? "";
    });
  }

  Future<void> _logout() async {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔹 Background
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primaryColor, AppColors.thirdColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // 🔹 Konten utama (Scrollable)
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // 🔹 AppBar Custom
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Welcome, $username!",
                          style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins-Bold',
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.logout, color: Colors.white, size: 30),
                          onPressed: _logout,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 🔹 Gambar Karakter
                  if (character.isNotEmpty)
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(character),
                      backgroundColor: Colors.white,
                    ),

                  const SizedBox(height: 20),

                  // 🔹 Card Informasi Pengguna
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        _buildUserInfo("👤 Nama Lengkap", fullName),
                        _buildUserInfo("🔹 Username", username),
                        _buildUserInfo("📧 Email", email),
                        _buildUserInfo("🎂 Tanggal Lahir", birthDate),
                        _buildUserInfo("🚻 Gender", gender),

                        const SizedBox(height: 20),

                        // 🔹 Tombol Logout
                        ElevatedButton(
                          onPressed: _logout,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            "Logout",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins-Bold',
                              color: Colors.white,
                            ),
                          ),
                        ),

                        const SizedBox(height: 40), // Memberikan ruang ekstra di bagian bawah
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Widget untuk menampilkan informasi pengguna
  Widget _buildUserInfo(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          leading: Icon(Icons.info, color: AppColors.primaryColor),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins-SemiBold',
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Poppins-Regular',
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
