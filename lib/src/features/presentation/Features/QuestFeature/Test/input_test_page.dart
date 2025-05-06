import 'package:flutter/material.dart';

class InputTestPage extends StatelessWidget {
  final int idLessonQuest;

  const InputTestPage({super.key, required this.idLessonQuest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Input Test')),
      body: const Center(
        child: Text(
          'Ini halaman InputTestPage',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
