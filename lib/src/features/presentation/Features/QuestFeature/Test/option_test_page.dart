import 'package:flutter/material.dart';

class OptionTestPage extends StatelessWidget {
  final int idLessonQuest;

  const OptionTestPage({super.key, required this.idLessonQuest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Option Test')),
      body: const Center(
        child: Text(
          'Ini halaman OptionTestPage',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
