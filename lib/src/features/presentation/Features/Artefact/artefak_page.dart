import 'package:flutter/material.dart';
import 'package:mathgasing_v1/src/features/presentation/Features/Artefact/artefak_module_page.dart';
import 'package:mathgasing_v1/src/shared/Components/artefact_progress_card.dart';
import 'package:mathgasing_v1/src/shared/Utils/app_colors.dart';
import '../../../../shared/Components/search_bar_custom.dart';
import '../../../data/models/quest_model.dart';
import '../../../data/repository/quest_repository.dart';

class ArtefakPage extends StatefulWidget {
  const ArtefakPage({super.key});

  @override
  State<ArtefakPage> createState() => _ArtefakPageState();
}

class _ArtefakPageState extends State<ArtefakPage> {
  final TextEditingController controller = TextEditingController();
  List<QuestModel> questList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchQuests();
  }

  Future<void> fetchQuests() async {
    final data = await QuestRepository().fetchQuestList(page: 1, pageSize: 10); // Sesuai repository kamu
    setState(() {
      questList = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              const Text(
                "Artefak Pembelajaran",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22,
                  fontFamily: 'Poppins-SemiBold',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Temukan artefak pembelajaran yang telah kamu pelajari dan dapatkan dari petualangan mu.",
                style: TextStyle(
                  color: AppColors.fontDescColor,
                  fontSize: 12,
                  fontFamily: 'Poppins-Light',
                ),
              ),
              const SizedBox(height: 16),
              SearchBarCustom(controller: controller),
              const SizedBox(height: 16),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      children: questList.map(
                        (quest) {
                          final modules = quest.moduleContent?.questModule ?? []; // Safely access questModule
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ArtefakModulePage(
                                    title: quest.titleQuest,
                                    description: quest.questDesc,
                                    questModules: modules, 
                                     // Use the safely accessed modules
                                  ),
                                ),
                              );
                            },
                            child: ArtefactProgressCard(
                              idQuest: quest.idQuest, 
                              titleQuest: quest.titleQuest, 
                              descQuest: quest.questDesc ?? '', 
                            ),
              
                          );
                        },
                      ).toList(),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}