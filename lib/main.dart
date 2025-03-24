import 'package:flutter/material.dart';
import 'package:mathgasing_v1/src/features/presentation/Authentication/RegisterPage/register_provider.dart';
import 'package:provider/provider.dart';
import 'package:mathgasing_v1/src/features/presentation/InitialPage/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "MathPlay Gasing",
        home: const SplashScreen(),
      ),
    );
  }
}
