import 'package:flutter/material.dart';

class StepsStatisticsScreen extends StatelessWidget {
  const StepsStatisticsScreen({super.key});

  // Определим основные цвета для темной темы
  static const Color bgColor = Color(0xFF0F172A); // Темно-синий/черный фон
  static const Color cardColor = Color(0xFF1E293B); // Цвет карточек
  static const Color accentColor = Color(0xFF38BDF8); // Светло-голубой неон

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
            'Активность',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildMainProgressCard(),
            const SizedBox(height: 24),
            _buildSecondaryStats(),
          ],
        ),
      ),
    );
  }

  Widget _buildMainProgressCard() {
    const int stepsTaken = 8432;
    const int stepsGoal = 10000;
    final double progress = stepsTaken / stepsGoal;

    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              // Фон индикатора
              SizedBox(
                width: 200,
                height: 200,
                child: CircularProgressIndicator(
                  value: 1.0,
                  strokeWidth: 12,
                  backgroundColor: Colors.white.withOpacity(0.05),
                  color: Colors.transparent,
                ),
              ),
              // Активный прогресс с неоновым свечением
              SizedBox(
                width: 200,
                height: 200,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 12,
                  backgroundColor: Colors.transparent,
                  color: accentColor,
                  strokeCap: StrokeCap.round,
                ),
              ),
              Column(
                children: [
                  const Icon(Icons.bolt, size: 40, color: accentColor),
                  const Text(
                    '$stepsTaken',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Text(
                    'цель $stepsGoal',
                    style: TextStyle(color: Colors.blueGrey.shade300, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            "До цели осталось 1 568 шагов",
            style: TextStyle(
                fontSize: 15,
                color: Colors.blueGrey.shade100,
                fontWeight: FontWeight.w400
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecondaryStats() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.4,
      children: [
        _statItem(Icons.local_fire_department, "340", "ккал", Colors.orangeAccent),
        _statItem(Icons.straighten, "5.2", "км", Colors.tealAccent),
        _statItem(Icons.timer, "45", "мин", Colors.purpleAccent),
        _statItem(Icons.favorite, "78", "bpm", Colors.pinkAccent),
      ],
    );
  }

  Widget _statItem(IconData icon, String value, String label, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                  value,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  )
              ),
              const SizedBox(width: 4),
              Text(
                  label,
                  style: TextStyle(color: Colors.blueGrey.shade400, fontSize: 12)
              ),
            ],
          ),
        ],
      ),
    );
  }
}