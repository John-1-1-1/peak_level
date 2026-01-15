import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _onboardingKey = 'onboarding_done';
  static const String _subscriptionKey = 'is_subscribed'; // Новый ключ
  late final SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  bool isOnboardingDone() => _prefs.getBool(_onboardingKey) ?? false;

  // Метод для проверки подписки
  bool isSubscribed() => _prefs.getBool(_subscriptionKey) ?? false;

  Future<void> setOnboardingDone() async => await _prefs.setBool(_onboardingKey, true);

  // Метод для сохранения покупки
  Future<void> setSubscribed(bool value) async => await _prefs.setBool(_subscriptionKey, value);
}