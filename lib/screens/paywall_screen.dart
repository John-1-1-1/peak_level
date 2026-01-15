import 'package:flutter/material.dart';
import '../services/storage_service.dart';
import 'steps_statistics_screen.dart';

class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

  void _navigateToMain(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const StepsStatisticsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              // Используем иконку крестика
              icon: const Icon(Icons.close, color: Colors.white, size: 28),
              // При нажатии просто переходим на главный экран
              onPressed: () => _navigateToMain(context),
            ),
          ),
              const Spacer(),
              const Icon(Icons.star_rounded, size: 100, color: Colors.orangeAccent),
              const SizedBox(height: 32),
              const Text(
                "ПОЛНЫЙ ДОСТУП",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 16),
              const Text(
                "Получите доступ ко всем функциям\nи аналитике вашей активности",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const Spacer(),
              // Карточка с ценой
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.orangeAccent.withOpacity(0.5)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("1 Месяц", style: TextStyle(color: Colors.white, fontSize: 18)),
                    Text("499 ₽ / мес", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Кнопка покупки
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  onPressed: () async {
                    // Логика покупки
                    final storage = StorageService();
                    await storage.init();
                    await storage.setSubscribed(true); // Сохраняем успех

                    if (context.mounted) {
                      _navigateToMain(context);
                    }
                  },
                  child: const Text("ПОДПИСАТЬСЯ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {}, // Логика восстановления покупок
                child: const Text("Восстановить покупки", style: TextStyle(color: Colors.grey)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}