import 'package:flutter/material.dart';
import 'package:mathgasing_v1/src/shared/Utils/app_colors.dart';
import '../../../../core/constants/app_images.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 70),
          child: SizedBox(
          height: screenHeight + 150,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Background Image
              SizedBox(
                height: screenHeight / 3.5,
                width: double.infinity,
                child: Image.asset(
                  AppImages.PROFILE_IMG_BG,
                  fit: BoxFit.cover,
                ),
              ),

              // White Container dengan isi konten + tombol
              Positioned(
                top: screenHeight / 3.8 - 50,
                left: 0,
                right: 0,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 16, left: 16, right: 16, bottom: 32,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "USERNAME",
                          style: TextStyle(
                            fontSize: 32,
                            fontFamily: 'Poppins-SemiBold',
                            color: AppColors.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text("username@gmail.com",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins-Light',
                            color: AppColors.fontDescColor,
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2, // Setengah lebar layar
                          child: const Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                            textAlign: TextAlign.left, // Optional: untuk perataan
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: 81,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue[100], // Biru muda
                            borderRadius: BorderRadius.circular(8), // Opsional untuk sudut membulat
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.monetization_on,
                                size: 16,
                                color: Colors.orange,
                              ),
                              SizedBox(width: 4),
                              Text(
                                '1000',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Profile",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins-SemiBold',
                            color: AppColors.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          height: 107,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFE3A6), // Fill warna
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.primaryColor, width: 2),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Nama Lengkap : example username',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Tanggal Lahir : 23 Februari 2003',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Jenis Kelamin : Laki Laki',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Lencana",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins-SemiBold',
                            color: AppColors.primaryColor,
                          ),
                        ),
                        const Text(
                          "Temukan lencana yang telah kamu kumpulkan dalam perjalananamu",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins-Light',
                            color: AppColors.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          color: AppColors.primaryColor,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(3, (index) {
                                return Container(
                                  width: 110,
                                  height: 108,
                                  margin: const EdgeInsets.only(left: 16), // Spasi antar container
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Item ${index + 1}',
                                      style: const TextStyle(color: Colors.black),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Tombol Edit Profile
                        SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              // TODO: Edit profile action
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            child: const Text(
                              'Edit Profile',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Tombol Log Out
                        SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              // TODO: Log out action
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            child: const Text(
                              'Log Out',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Avatar & Edit Button
              Positioned(
                top: screenHeight / 3.5 - 95,
                right: -24, // Menjorok keluar kanan 20px
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 190,
                      height: 190,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor.withOpacity(0.8),
                        border: Border.all(color: Colors.white, width: 4),
                      ),
                      child: const Center(
                        child: Icon(Icons.person, size: 80, color: Colors.white),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: GestureDetector(
                        onTap: () {
                          // TODO: Edit avatar
                        },
                        child: Container(
                          width: 63,
                          height: 63,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ),
      ),
    );
  }
}
