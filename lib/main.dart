import 'package:flutter/material.dart';
import 'services/storage_service.dart';
import 'screens/onboarding_screen.dart';
import 'screens/steps_statistics_screen.dart';
import 'screens/paywall_screen.dart';

void main() async {
  // 1. Инициализация привязок Flutter
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Инициализация сервиса памяти
  final storageService = StorageService();
  await storageService.init();

  // 3. Логика выбора стартового экрана
  final bool onboarded = storageService.isOnboardingDone();
  final bool subscribed = storageService.isSubscribed();

  Widget startScreen;

  if (!onboarded) {
    startScreen = const OnboardingScreen();
  } else if (!subscribed) {
    startScreen = const PaywallScreen();
  } else {
    startScreen = const StepsStatisticsScreen();
  }

  // 4. Запуск через MyApp
  runApp(MyApp(startScreen: startScreen));
}

class MyApp extends StatelessWidget {
  final Widget startScreen;

  const MyApp({super.key, required this.startScreen});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peak Level',
      // Настраиваем темную тему здесь, чтобы она была везде одинаковой
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        primarySwatch: Colors.orange,
      ),
      home: startScreen,
    );
  }
}