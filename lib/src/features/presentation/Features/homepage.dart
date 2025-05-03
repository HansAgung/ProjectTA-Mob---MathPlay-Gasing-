import 'package:flutter/material.dart';
import 'package:mathgasing_v1/src/shared/Components/buttom_navbar_custom.dart';
import 'package:mathgasing_v1/src/shared/Utils/app_colors.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../core/constants/app_images.dart';
import '../../../shared/Components/header_homepage.dart';
import '../../../shared/Components/search_bar_custom.dart';
import '../../data/models/quest_model.dart';
import '../../data/repository/quest_repository.dart';
import '../../../shared/Components/quest_progress_card.dart';  // Import komponen QuestProgressCard

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final QuestRepository _repo = QuestRepository();

  List<QuestModel> _quests = [];
  bool _isLoading = false;
  bool _hasMore = true;
  int _currentPage = 1;
  final int _pageSize = 10;

  @override
  void initState() {
    super.initState();
    _fetchQuests();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchQuests() async {
    if (_isLoading || !_hasMore) return;

    setState(() => _isLoading = true);

    try {
      final quests = await _repo.fetchQuestList(page: _currentPage, pageSize: _pageSize);

      setState(() {
        _quests.addAll(quests);
        _isLoading = false;
        _currentPage++;
        if (quests.length < _pageSize) {
          _hasMore = false;
        }
      });
    } catch (e) {
      print('❌ Error fetching quests: $e');
      setState(() => _isLoading = false);
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100) {
      _fetchQuests();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: [
            Container(color: Colors.white),

            // Background Pattern
            SizedBox(
              height: screenHeight / 2,
              width: double.infinity,
              child: Image.asset(
                AppImages.PATTERN_FIRST,
                fit: BoxFit.cover,
              ),
            ),

            // Scrollable content
            SingleChildScrollView(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderHomepage(username: "Atalya Saragih"),
                  const SizedBox(height: 20),

                  // Title
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pembelajaran mu",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 20,
                              fontFamily: 'Poppins-SemiBold',
                            ),
                          ),
                          Text(
                            "Ayo mulai petualanganmu!!",
                            style: TextStyle(
                              color: AppColors.fontDescColor,
                              fontSize: 12,
                              fontFamily: 'Poppins-Light',
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Lihat Semua",
                        style: TextStyle(
                          color: AppColors.fontDescColor,
                          fontSize: 10,
                          fontFamily: 'Poppins-Light',
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Progress Card
                  Container(
                    height: screenHeight / 6.5,
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left Text
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Progress Capaianmu",
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 22,
                                  fontFamily: 'Poppins-SemiBold',
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Lanjutkan progressmu hari ini",
                                style: TextStyle(
                                  color: AppColors.fontDescColor,
                                  fontSize: 12,
                                  fontFamily: 'Poppins-Light',
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Circular Progress
                        CircularPercentIndicator(
                          radius: 45.0,
                          lineWidth: 8.0,
                          percent: 0.75,
                          backgroundColor: Colors.grey.shade300,
                          progressColor: AppColors.primaryColor,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: const Text(
                            "75%",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Search Bar
                  SearchBarCustom(
                    controller: _searchController,
                    onChanged: (value) {},
                  ),

                  const SizedBox(height: 20),

                  // Quest List
                  ListView.builder(
                    itemCount: _quests.length + (_hasMore ? 1 : 0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (index >= _quests.length) {
                        return const Center(child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: CircularProgressIndicator(),
                        ));
                      }

                      final quest = _quests[index];

                      return QuestProgressCard(
                        idQuest: quest.idQuest,
                        titleQuest: quest.titleQuest,
                        imageUrl: quest.imgCardQuest,
                        progress: quest.progress, // Pastikan ini dalam range 0.0 - 1.0
                      );
                    },
                  ),

                  const SizedBox(height: 80), // space for bottom navbar
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
