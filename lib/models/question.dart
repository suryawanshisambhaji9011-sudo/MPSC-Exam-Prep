import 'package:flutter/material.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('विस्तृत विश्लेषण'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0F766E), Color(0xFF14B8A6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'एकूण कामगिरी',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '84%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '1,240 प्रश्न सोडले',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'विषयवार कामगिरी',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 12),
            _SubjectAnalyticsCard(
              subject: 'मराठी',
              percentage: 92,
              questions: 120,
              color: const Color(0xFF0F766E),
            ),
            _SubjectAnalyticsCard(
              subject: 'इतिहास',
              percentage: 88,
              questions: 145,
              color: const Color(0xFF7C3AED),
            ),
            _SubjectAnalyticsCard(
              subject: 'भूगोल',
              percentage: 85,
              questions: 98,
              color: const Color(0xFF2563EB),
            ),
            _SubjectAnalyticsCard(
              subject: 'संविधान',
              percentage: 80,
              questions: 67,
              color: const Color(0xFFDC2626),
            ),
            _SubjectAnalyticsCard(
              subject: 'विज्ञान',
              percentage: 87,
              questions: 110,
              color: const Color(0xFFF59E0B),
            ),
            const SizedBox(height: 20),
            const Text(
              'सुधारण्याचे क्षेत्र',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 12),
            const _WeakAreaCard(
              subject: 'अर्थशास्त्र',
              accuracy: 72,
              recommendation: 'आर्थिक संकल्पना आणि बाजार यावर अधिक लक्ष केंद्रित करा.',
            ),
            const _WeakAreaCard(
              subject: 'तर्कशास्त्र',
              accuracy: 78,
              recommendation: 'अनुक्रम आणि संबंध प्रश्नांवर सरावास चालू ठेवा.',
            ),
          ],
        ),
      ),
    );
  }
}

class _SubjectAnalyticsCard extends StatelessWidget {
  final String subject;
  final int percentage;
  final int questions;
  final Color color;

  const _SubjectAnalyticsCard({
    required this.subject,
    required this.percentage,
    required this.questions,
    required this.color,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subject,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF0F172A),
                ),
              ),
              Text(
                '$percentage%',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: percentage / 100,
              minHeight: 8,
              backgroundColor: color.withOpacity(0.12),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$questions प्रश्न सोडले',
            style: const TextStyle(
              color: Color(0xFF64748B),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _WeakAreaCard extends StatelessWidget {
  final String subject;
  final int accuracy;
  final String recommendation;

  const _WeakAreaCard({
    required this.subject,
    required this.accuracy,
    required this.recommendation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF3C7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFFCD34D)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subject,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF92400E),
                ),
              ),
              Text(
                '$accuracy% अचूकता',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFB45309),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            recommendation,
            style: const TextStyle(
              color: Color(0xFF78350F),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
