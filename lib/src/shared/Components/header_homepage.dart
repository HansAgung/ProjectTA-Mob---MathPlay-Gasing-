import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core/constants/app_images.dart';

class HeaderHomepage extends StatelessWidget {
  final String username;

  const HeaderHomepage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final String currentDate = DateFormat('EEEE, d MMMM yyyy').format(DateTime.now());

    return Container(
      height: screenHeight / 5.3,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.HOMEPAGE_CARD),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // ✅ Rata tengah vertikal
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome,",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
            ),
            Text(
              username,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              currentDate,
              style: const TextStyle(fontSize: 10, color: Colors.white),
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                _buildBlueBox("1000"),
                const SizedBox(width: 10),
                _buildBlueBox("1000"),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBlueBox(String value) {
    return Container(
      width: 89,
      height: 24,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        value,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
