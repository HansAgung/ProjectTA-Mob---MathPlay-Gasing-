import 'package:flutter/material.dart';
import 'package:mathgasing_v1/src/features/presentation/Authentication/login_page.dart';
import 'package:mathgasing_v1/src/shared/Components/button_primary_custom.dart';
import 'package:mathgasing_v1/src/shared/Components/custom_password_field.dart';
import 'package:mathgasing_v1/src/shared/Components/term_checkbox.dart';
import 'package:mathgasing_v1/src/shared/Utils/app_colors.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final TextEditingController passwordController = TextEditingController();
     final TextEditingController confirmPasswordController = TextEditingController();

    @override
    void goToLoginPage() {
      Navigator.pushReplacement(context, 
      MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  
    return Scaffold(
      body: Stack(
        children: [
          // Gambar Latar Belakang
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/img_forgetpassword_page.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Container Putih untuk Form Lupa Password
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight * 0.58, // Setengah layar bawah
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 102,
                      height: 7,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),

                   const SizedBox(height: 20),

                  const Text(
                    "Buat Ulang Password",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Poppins-Bold',
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Jangan lupa lagi ya!!",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins-Medium',
                      color: AppColors.thirdColor,
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomPasswordField(hintText: 'Masukan Password baru', controller: passwordController),
                  const SizedBox(height: 15),
                  CustomPasswordField(hintText: 'Konfirmasi Password baru', controller: confirmPasswordController),
                  const Spacer(),
                  TermsCheckbox(
                    onChanged: (isChecked) {
                      print("Checkbox status: $isChecked");
                    },
                  ),
                  const SizedBox(height: 10),
                  ButtonPrimaryCustom(text: 'Ubah Password', onPressed: goToLoginPage),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
