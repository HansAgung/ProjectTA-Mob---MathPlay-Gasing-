import 'dart:convert';

class OnboardingModel {
  final String backgroundImg;
  final String title;
  final String description;

  OnboardingModel({
    required this.backgroundImg,
    required this.title,
    required this.description,
  });

  factory OnboardingModel.fromJson(Map<String, dynamic> json) {
    return OnboardingModel(
      backgroundImg: json['background_img'],
      title: json['title_onboarding'],
      description: json['desc_onboarding'],
    );
  }

  static List<OnboardingModel> fromJsonList(String jsonString) {
    final List<dynamic> data = json.decode(jsonString);
    return data.map((item) => OnboardingModel.fromJson(item)).toList();
  }
}
