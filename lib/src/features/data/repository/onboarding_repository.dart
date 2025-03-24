import 'package:flutter/services.dart' show rootBundle;
import '../models/onboarding_model.dart';

class OnboardingRepository {
  static Future<List<OnboardingModel>> loadOnboardingData() async {
    final String response = await rootBundle.loadString('lib/src/features/data/datasources/onboarding_data.json');
    return OnboardingModel.fromJsonList(response);
  }
}
