import 'package:flutter/material.dart';
import 'package:mpsc_katta/screens/login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      {
        'title': 'प्रश्नसंग्रह',
        'subtitle': 'मराठी, इतिहास, भूगोल, संविधान आणि अर्थशास्त्रांवरील 20,000+ प्रश्न.',
        'icon': Icons.quiz_rounded,
      },
      {
        'title': 'MOCK TEST',
        'subtitle': 'रात्रीच्या वेळापत्रकानुसार वेळेचे नियोजन करून सराव करा.',
        'icon': Icons.timer_rounded,
      },
      {
        'title': 'प्रगती ट्रॅकिंग',
        'subtitle': 'तुमची प्रगती, स्कोअर आणि आवर्तित सराव ट्रॅक करा.',
        'icon': Icons.bar_chart_rounded,
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    ),
                    child: const Text('Skip'),
                  ),
                ],
              ),
              Expanded(
                child: PageView.builder(
                  itemCount: pages.length,
                  itemBuilder: (context, index) {
                    final page = pages[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(page['icon'] as IconData, size: 90, color: const Color(0xFF0F766E)),
                        const SizedBox(height: 28),
                        Text(
                          page['title'] as String,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          page['subtitle'] as String,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0F766E),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text('शुरू करा'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
