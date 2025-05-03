import 'package:flutter/material.dart';
import 'package:mathgasing_v1/src/features/presentation/Features/ProfileFeature/profile_page.dart';
import 'package:mathgasing_v1/src/features/presentation/Features/artefak_page.dart';
import 'package:mathgasing_v1/src/features/presentation/Features/leaderboard_page.dart';
import 'package:mathgasing_v1/src/shared/Components/buttom_navbar_custom.dart';
import 'QuestFeature/quest_page.dart'; // Contoh halaman yang akan ditampilkan
import 'homepage.dart'; // Halaman lain, misalnya quest
import 'package:mathgasing_v1/src/shared/Utils/app_colors.dart'; // Import AppColors untuk primaryColor

class MainWrapperPage extends StatefulWidget {
  const MainWrapperPage({super.key});

  @override
  _MainWrapperPageState createState() => _MainWrapperPageState();
}

class _MainWrapperPageState extends State<MainWrapperPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Homepage(),
    const QuestPage(),
    const ArtefakPage(),
    const LeaderboardPage(),
    const ProfilePage(),
  ];

  // Fungsi untuk berpindah halaman
  void _onBottomNavTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan borderRadius di bawah dan teks putih
      appBar: _currentIndex != 0
          ? PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight), // Ukuran AppBar
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                child: AppBar(
                  title: Text(
                    'Page ${_currentIndex + 1}',
                    style: const TextStyle(color: Colors.white), // Teks berwarna putih
                  ),
                  backgroundColor: AppColors.primaryColor, // Menggunakan primaryColor
                  iconTheme: const IconThemeData(color: Colors.white), // Ikon back berwarna putih
                  elevation: 0, // Menghilangkan bayangan
                ),
              ),
            )
          : null, // Tidak ada AppBar jika halaman pertama (Homepage)

      // SafeArea untuk memastikan konten tidak tertutup area aman perangkat
      body: SafeArea(
        child: _pages[_currentIndex], // Menampilkan halaman sesuai dengan index yang dipilih
      ),

      bottomNavigationBar: BottomNavbarCustom(
        currentIndex: _currentIndex,
        onTap: _onBottomNavTapped,  // Menangani tap pada bottom navbar
      ),
    );
  }
}
