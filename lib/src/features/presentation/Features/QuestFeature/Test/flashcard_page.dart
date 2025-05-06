import 'package:flutter/material.dart';

class FlashcardPage extends StatelessWidget {
  final int idLessonQuest;

  const FlashcardPage({super.key, required this.idLessonQuest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flashcard')),
      body: const Center(
        child: Text(
          'Ini halaman FlashcardPage',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
