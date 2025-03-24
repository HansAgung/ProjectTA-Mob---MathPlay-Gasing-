import 'package:flutter/material.dart';
import 'package:mathgasing_v1/src/features/presentation/InitialPage/onboarding_page.dart';
import 'package:mathgasing_v1/src/core/constants/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(context, 
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    // Dapatkan tinggi layar
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Pattern hanya menutupi setengah atas layar
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: screenHeight / 2, // Setengah layar
              width: double.infinity,
              child: Image.asset(
                AppImages.PATTERN_FIRST,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Logo di tengah layar
          Center(
            child: Image.asset(
              AppImages.ICON_MATHPLAY_GASING,
              width: 150,
              height: 150,
            ),
          ),

          // Teks di bagian bawah layar
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Version 1.1.0",
                  style: TextStyle(
                    fontFamily: 'Poppins-SemiBold',
                    fontSize: 16, 
                    ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Develop By Team 10",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12, 
                    ),
                ),
                const Text(
                  "Institut Teknologi DEL",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10, 
                    ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

  