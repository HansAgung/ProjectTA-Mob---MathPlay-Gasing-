import 'package:flutter/material.dart';

class SubjectMatterPage extends StatelessWidget {
  final int idLessonQuest;

  const SubjectMatterPage({super.key, required this.idLessonQuest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Subject Matter')),
      body: const Center(
        child: Text(
          'Ini halaman SubjectMatterPage',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
