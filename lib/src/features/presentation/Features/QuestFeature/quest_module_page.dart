import 'package:flutter/material.dart';
import 'package:mathgasing_v1/src/shared/Components/buttom_navbar_custom.dart';
import 'package:mathgasing_v1/src/shared/Utils/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../shared/Components/card_module.dart';
import '../../../../shared/Components/lesson_card.dart';
import '../../../data/models/quest_module_model.dart';
import '../../../data/models/lesson_quest_model.dart';

class QuestModulePage extends StatelessWidget {
  final String title;
  final List<QuestModuleModel> questModules;

  const QuestModulePage({
    super.key,
    required this.title,
    required this.questModules,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight / 3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.QUEST_IMG_1),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Back button
          Positioned(
            top: 40,
            left: 16,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: AppColors.primaryColor,
                  size: 24,
                ),
              ),
            ),
          ),

          // Content
          Positioned(
            top: screenHeight / 3.5,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontFamily: 'Poppins-SemiBold',
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Temukan artefak pembelajaran yang telah kamu pelajari dan dapatkan dari petualangan mu.",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins-Light',
                      color: AppColors.fontDescColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: questModules.length,
                      itemBuilder: (context, index) {
                        final module = questModules[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Card utama modul
                            CardModule(
                              title: module.titleQuestModule,
                              description: module.questModuleDesc,
                            ),
                            const SizedBox(height: 4),

                            // Tampilkan semua soal dalam modul jika ada
                            if (module.lessonQuest != null)
                              ...module.lessonQuest!.map(
                                (lesson) => Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  child: LessonCard(
                                    title: lesson.titleLessonQuest,
                                    description: lesson.questLessonDesc,
                                  ),
                                ),
                              ),

                            const SizedBox(height: 4),
                          ],
                        );
                      },
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
