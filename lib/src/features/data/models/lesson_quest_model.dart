class LessonQuestModel {
  final int idLessonQuest;
  final int lessonType;
  final String titleLessonQuest;
  final String questLessonDesc;
  final int typeLessonQuest;
  final String status;

  LessonQuestModel({
    required this.idLessonQuest,
    required this.lessonType,
    required this.titleLessonQuest,
    required this.questLessonDesc,
    required this.typeLessonQuest,
    required this.status,
  });

  factory LessonQuestModel.fromJson(Map<String, dynamic> json) {
    return LessonQuestModel(
      idLessonQuest: int.tryParse(json['id_lesson_quest'].toString()) ?? 0,
      lessonType: int.tryParse(json['lesson_type'].toString()) ?? 0,
      titleLessonQuest: json['title_lesson_quest']?.toString() ?? '',
      questLessonDesc: json['quest_lesson_desc']?.toString() ?? '',
      typeLessonQuest: json['type_lesson_quest'] ?? 0,
      status: json['status']?.toString() ?? '',
    );
  }

}
