import 'package:flutter/material.dart';
import 'package:mathgasing_v1/src/features/data/repository/user_repository.dart';
import 'package:mathgasing_v1/src/features/presentation/Authentication/ForgetPassword/change_password_page.dart';
import 'package:mathgasing_v1/src/features/presentation/Authentication/login_page.dart';
import 'package:mathgasing_v1/src/shared/Components/button_fourth_custom.dart';
import 'package:mathgasing_v1/src/shared/Components/button_primary_custom.dart';
import 'package:mathgasing_v1/src/shared/Components/custom_textfield.dart';
import 'package:mathgasing_v1/src/shared/Components/instruction_box_custom.dart';
import 'package:mathgasing_v1/src/shared/Components/alert_success_custom.dart';
import 'package:mathgasing_v1/src/shared/Components/alert_failed_custom.dart';
import 'package:mathgasing_v1/src/shared/Utils/app_colors.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final UserRepository _userRepository = UserRepository();

  bool _showSuccessAlert = false;
  bool _showFailedAlert = false;
  String? _emailError;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  bool _isValidEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(email);
  }

  void _validateAndSubmit() {
    String enteredEmail = _emailController.text.trim();

    // Cek apakah email valid
    if (enteredEmail.isEmpty) {
      setState(() {
        _emailError = "Email tidak boleh kosong";
      });
      return;
    } else if (!_isValidEmail(enteredEmail)) {
      setState(() {
        _emailError = "Format email tidak valid";
      });
      return;
    }

    // Jika valid, reset error dan lanjut cek email di database
    setState(() {
      _emailError = null;
    });

    bool emailExists = _userRepository.isEmailRegistered(enteredEmail);

    if (emailExists) {
      setState(() {
        _showSuccessAlert = true;
        _showFailedAlert = false;
      });

      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ChangePasswordPage()),
        );
      });
    } else {
      setState(() {
        _showFailedAlert = true;
        _showSuccessAlert = false;
      });

      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _showFailedAlert = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    bool isTextFilled = _emailController.text.isNotEmpty;

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

          // Alert berhasil jika email ditemukan
          if (_showSuccessAlert)
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: AlertSuccessCustom(
                message: "Email kamu ditemukan",
              ),
            ),

          // Alert gagal jika email tidak ditemukan
          if (_showFailedAlert)
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: AlertFailedCustom(
                message: "Email kamu tidak ditemukan",
              ),
            ),

          // Container Putih untuk Form Lupa Password
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight * 0.5, // Setengah layar bawah
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
                    "Lupa Password?",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins-Bold',
                      color: AppColors.primaryColor,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const InstructionBoxCustom(
                    message: 'Harap masukan alamat email anda, sebagai verifikasi diri anda',
                  ),

                  const SizedBox(height: 30),

                  // CustomTextField dengan error message
                  CustomTextField(
                    hintText: 'Masukan Email Kamu',
                    controller: _emailController,
                    errorMessage: _emailError,
                  ),

                  const SizedBox(height: 20),

                  const Spacer(), // Mendorong tombol ke bawah

                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: SizedBox(
                      width: double.infinity,
                      child: isTextFilled
                          ? ButtonPrimaryCustom(
                              text: "Selanjutnya",
                              onPressed: _validateAndSubmit,
                            )
                          : ButtonFourthCustom(
                              text: "Selanjutnya",
                              onPressed: null,
                            ),
                    ),
                  ),

                  //untuk "Belum punya akun"
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: const Text(
                        "Saya sudah ingat, akunn saya",
                        style: TextStyle(
                          color: AppColors.thirdColor,
                          fontSize: 14,
                          fontFamily: 'Poppins-Medium'),
                      ),
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
}
