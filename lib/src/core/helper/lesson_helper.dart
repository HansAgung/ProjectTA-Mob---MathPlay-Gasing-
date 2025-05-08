List<T> filterLessonByType<T>(List<T> lessonList, int type) {
  return lessonList.where((lesson) {
    final dynamic item = lesson;
    return item.typeLessonQuest == type && item.status == "complete";
  }).toList();
}
