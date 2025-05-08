class SubjectMatterModel {
  final int idSubjectMatter;
  final int idQuestLesson;
  final String titleSubjectMatter;
  final String subjectMatterDesc;
  final List<Content> content;
  final String createdAt;

  SubjectMatterModel({
    required this.idSubjectMatter,
    required this.idQuestLesson,
    required this.titleSubjectMatter,
    required this.subjectMatterDesc,
    required this.content,
    required this.createdAt,
  });

  factory SubjectMatterModel.fromJson(Map<String, dynamic> json) {
    return SubjectMatterModel(
      idSubjectMatter: json['id_subject_matter'],
      idQuestLesson: json['id_quest_lesson'],
      titleSubjectMatter: json['tittle_subject_matter'],
      subjectMatterDesc: json['subject_matter_desc'],
      content: (json['content'] as List).map((e) => Content.fromJson(e)).toList(),
      createdAt: json['created_at'],
    );
  }
}

class Content {
  final String? videoUrl;
  final String titleMaterial;
  final String descriptionMaterial;
  final String? materialImgSupport;

  Content({
    this.videoUrl,
    required this.titleMaterial,
    required this.descriptionMaterial,
    this.materialImgSupport,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      videoUrl: json['video_url'],
      titleMaterial: json['title_material'],
      descriptionMaterial: json['description_material'],
      materialImgSupport: json['material_img_support'],
    );
  }
}
