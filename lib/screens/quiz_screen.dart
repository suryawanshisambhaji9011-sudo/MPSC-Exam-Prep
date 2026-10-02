import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('प्रगती'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'तुमची तयारी स्थिती',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 20),
            _MetricCard(title: 'सध्याचा स्कोअर', value: '84%', color: const Color(0xFF0F766E)),
            const SizedBox(height: 12),
            _MetricCard(title: 'मॉक टेस्ट', value: '12/20', color: const Color(0xFF7C3AED)),
            const SizedBox(height: 12),
            _MetricCard(title: 'सराव प्रश्न', value: '1,240', color: const Color(0xFF2563EB)),
            const SizedBox(height: 20),
            const Text(
              'उपलब्धी',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            const _AchievementTile(title: 'मराठी व्याकरण', subtitle: 'लक्ष्य पूर्ण', icon: Icons.check_circle_rounded),
            const _AchievementTile(title: 'इतिहास', subtitle: 'सात दिवसांचा रूटीन', icon: Icons.auto_awesome_rounded),
            const _AchievementTile(title: 'संविधान', subtitle: 'प्रॅक्टिस चालू', icon: Icons.timeline_rounded),
          ],
        ),
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const _MetricCard({
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: color.withOpacity(0.12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFF0F172A),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Color(0xFF0F172A),
            ),
          ),
        ],
      ),
    );
  }
}

class _AchievementTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _AchievementTile({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: const Color(0xFF0F766E).withOpacity(0.12),
            child: Icon(icon, color: const Color(0xFF0F766E)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Color(0xFF64748B)),
        ],
      ),
    );
  }
}
