import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mathgasing_v1/src/shared/Components/button_third_custom.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../shared/Utils/app_colors.dart';
import '../../../../data/repository/option_question_repository.dart';
import '../../../../data/models/option_question_model.dart';

class OptionTestPage extends StatefulWidget {
  const OptionTestPage({super.key});

  @override
  State<OptionTestPage> createState() => _OptionTestPageState();
}

class _OptionTestPageState extends State<OptionTestPage> {
  late Future<OptionTestModel> futureOptionTest;
  int currentQuestionIndex = 0;
  Map<int, String> selectedAnswers = {};
  late int remainingTime;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    futureOptionTest = OptionTestRepository().fetchOptionTest();
    futureOptionTest.then((data) {
      remainingTime = data.setTime;
      startTimer();
    });
  }

  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (remainingTime > 0) {
            remainingTime--;
          } else {
            timer.cancel();
            _showFinishDialog();
          }
        });
      }
    });
  }

  void _showFinishDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Kamu Hebat!"),
        content: const Text("Selamat, kamu sudah menyelesaikan kuis."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.QUESTION_BACKGROUND),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Safe Area
          SafeArea(
            child: FutureBuilder<OptionTestModel>(
              future: futureOptionTest,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data!;
                  final question = data.questions[currentQuestionIndex];
                  final answer = data.answers[currentQuestionIndex];

                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Back Button
                        Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: const [
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
                        const SizedBox(height: 16),

                        // Header
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              data.titleQuestion,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: AppColors.fontDescColor,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "Sisa Waktu",
                              style: TextStyle(fontSize: 12, color: AppColors.thirdColor),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "$remainingTime detik",
                              style: const TextStyle(
                                fontSize: 16,
                                color: AppColors.fontDescColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // Question Box
                        Container(
                          height: screenHeight / 8,
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF0FAFA),
                            border: Border.all(color: AppColors.primaryColor),
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: question.type == 'image'
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(24),
                                  child: Image.network(
                                    question.content,
                                    fit: BoxFit.contain,
                                  ),
                                )
                              : Center(
                                  child: Text(
                                    question.content,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.fontDescColor,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                        ),

                        const SizedBox(height: 24),

                        // Question Description
                        Text(
                          question.questDesc,
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.fontDescColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Answer Options
                        Expanded(
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: answer.options.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              childAspectRatio: 1.2,
                            ),
                            itemBuilder: (context, index) {
                              final opt = answer.options[index];
                              final isSelected = selectedAnswers[currentQuestionIndex] == opt.optionId;

                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedAnswers[currentQuestionIndex] = opt.optionId;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: isSelected
                                          ? AppColors.primaryColor
                                          : Colors.grey.shade300,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: opt.type == 'image'
                                      ? Image.network(opt.content, fit: BoxFit.contain)
                                      : Center(
                                          child: Text(
                                            opt.content,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromARGB(255, 20, 230, 220),
                                            ),
                                          ),
                                        ),
                                ),
                              );
                            },
                          ),
                        ),

                        // Next Button
                        SizedBox(
                          width: double.infinity,
                          child: ButtonThirdCustom(
                            text: currentQuestionIndex < data.questions.length - 1
                                ? 'Selanjutnya'
                                : 'Kamu Hebat',
                            
                            onPressed: () {
                              if (currentQuestionIndex < data.questions.length - 1) {
                                setState(() {
                                  currentQuestionIndex++;
                                });
                              } else {
                                _timer?.cancel();
                                _showFinishDialog();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Gagal memuat data: ${snapshot.error}'));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
