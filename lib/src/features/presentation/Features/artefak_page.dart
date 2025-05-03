import 'package:flutter/material.dart';
import 'package:mathgasing_v1/src/shared/Utils/app_colors.dart';

class ArtefakPage extends StatefulWidget {
  const ArtefakPage({super.key});

  @override
  State<ArtefakPage> createState() => _ArtefakPageState();
}

class _ArtefakPageState extends State<ArtefakPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Header dengan tombol back
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); 
                    },
                    child: const Icon(Icons.arrow_back, color: AppColors.primaryColor, size: 28),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "Quest",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Konten utama di tengah layar
          Center(
            child: Text(
              "Ini halaman ArtefakPage",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const SizedBox(), // Kosong karena halaman ini diakses dari nav utama
    );
  }
}