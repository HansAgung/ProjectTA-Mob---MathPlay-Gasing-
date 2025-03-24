import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mathgasing_v1/src/features/data/repository/user_database_repository.dart';
import 'package:mathgasing_v1/src/features/presentation/Authentication/RegisterPage/register_gender_page.dart';
import 'package:mathgasing_v1/src/features/presentation/Features/homepage.dart';
import 'package:mathgasing_v1/src/shared/Components/alert_failed_custom.dart';
import 'package:mathgasing_v1/src/shared/Utils/app_colors.dart';
import 'package:mathgasing_v1/src/shared/Components/custom_textfield.dart';
import 'package:mathgasing_v1/src/shared/Components/custom_password_field.dart';
import 'package:mathgasing_v1/src/shared/Components/button_primary_custom.dart';
import 'package:mathgasing_v1/src/features/presentation/Authentication/ForgetPassword/forget_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final UserRepository _userRepository = UserRepository(); // 🔹 Tambahkan UserRepository
  String? _emailError;
  bool _showAlert = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _isValidEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(email);
  }

  Future<void> _validateAndLogin() async {
    String enteredEmail = _emailController.text.trim();
    String enteredPassword = _passwordController.text.trim();

    setState(() {
      _emailError = null;
    });

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

    // 🔹 Ambil data dari SharedPreferences menggunakan UserRepository
    Map<String, String?> userData = await _userRepository.getUserData();
    String? storedEmail = userData['email'];
    String? storedPassword = userData['password'];

    // 🔍 Print data untuk debugging
    print("🔍 Data dari SharedPreferences sebelum login:");
    print("Stored Email: $storedEmail");
    print("Stored Password: $storedPassword");

    print("🔍 Data yang diinput oleh user:");
    print("Entered Email: $enteredEmail");
    print("Entered Password: $enteredPassword");

    if (enteredEmail == storedEmail && enteredPassword == storedPassword) {
      print("✅ Login berhasil!");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Homepage()),
      );
    } else {
      print("❌ Login gagal: Email atau Password salah!");
      setState(() {
        _showAlert = true;
      });

      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          setState(() {
            _showAlert = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/img_login_page.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            top: screenHeight * 0.25,
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight * 0.75,
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
                  const SizedBox(height: 16),

                  const Text(
                    "Halo,",
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: 'Poppins-Bold',
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const Text(
                    "Login Sekarang",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins-Medium',
                      color: AppColors.thirdColor,
                    ),
                  ),
                  const SizedBox(height: 20),

                  CustomTextField(
                    hintText: "Masukkan email",
                    controller: _emailController,
                    errorMessage: _emailError,
                  ),
                  const SizedBox(height: 16),

                  CustomPasswordField(
                    hintText: "Masukan Password Anda",
                    controller: _passwordController,
                  ),
                  const SizedBox(height: 10),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ForgetPasswordPage()),
                        );
                      },
                      child: const Text(
                        "Lupa Password?",
                        style: TextStyle(color: AppColors.thirdColor),
                      ),
                    ),
                  ),

                  ButtonPrimaryCustom(
                    text: 'Masuk',
                    onPressed: _validateAndLogin,
                  ),

                  const SizedBox(height: 10),

                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterGenderPage()),
                        );
                      },
                      child: const Text(
                        "Belum Punya Akun",
                        style: TextStyle(
                          color: AppColors.thirdColor,
                          fontSize: 14,
                          fontFamily: 'Poppins-SemiBold',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          if (_showAlert)
            Positioned(
              top: 60,
              left: 0,
              right: 0,
              child: const AlertFailedCustom(
                message: "Akun tidak ditemukan, periksa kembali email dan password kamu",
              ),
            ),
        ],
      ),
    );
  }
}
