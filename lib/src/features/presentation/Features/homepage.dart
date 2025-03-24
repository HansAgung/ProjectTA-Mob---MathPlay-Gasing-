import 'package:flutter/material.dart';
import 'package:mathgasing_v1/src/features/presentation/Authentication/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      character = prefs.getString('character') ?? "Tidak ditemukan";
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
      appBar: AppBar(title: Text("Homepage")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("👤 Nama Lengkap: $fullName", style: TextStyle(fontSize: 18)),
            Text("🔹 Username: $username", style: TextStyle(fontSize: 18)),
            Text("📧 Email: $email", style: TextStyle(fontSize: 18)),
            Text("🎂 Tanggal Lahir: $birthDate", style: TextStyle(fontSize: 18)),
            Text("🚻 Gender: $gender", style: TextStyle(fontSize: 18)),
            Text("🎭 Karakter: $character", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _logout,
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
