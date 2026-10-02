import 'package:flutter/material.dart';
import 'package:mpsc_katta/data/mock_questions.dart';
import 'package:mpsc_katta/models/question.dart';
import 'package:mpsc_katta/widgets/stat_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final subjectList = [
      {'title': 'मराठी', 'icon': Icons.edit_note_rounded, 'color': const Color(0xFF0F766E)},
      {'title': 'इतिहास', 'icon': Icons.account_balance_rounded, 'color': const Color(0xFF7C3AED)},
      {'title': 'भूगोल', 'icon': Icons.map_rounded, 'color': const Color(0xFF2563EB)},
      {'title': 'संविधान', 'icon': Icons.gavel_rounded, 'color': const Color(0xFFDC2626)},
      {'title': 'अर्थशास्त्र', 'icon': Icons.attach_money_rounded, 'color': const Color(0xFF059669)},
      {'title': 'विज्ञान', 'icon': Icons.science_rounded, 'color': const Color(0xFFF59E0B)},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('MPSC Katta'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: CircleAvatar(
              backgroundColor: Color(0xFF0F766E),
              child: Icon(Icons.person, color: Colors.white),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'नमस्कार! तुमच्या MPSC तयारीसाठी तयार.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'नियमित सराव, MOCK TEST आणि प्रगती ट्रॅकिंगसह सुंदर UI.',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF475569),
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.25,
              children: const [
                StatCard(label: 'एकूण प्रश्न', value: '20,000+', accent: Color(0xFF0F766E)),
                StatCard(label: 'सोडत', value: '88%', accent: Color(0xFF7C3AED)),
                StatCard(label: 'दिवस', value: '14', accent: Color(0xFF2563EB)),
                StatCard(label: 'स्ट्रीक', value: '12', accent: Color(0xFFDC2626)),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'विषय निवडा',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: subjectList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.15,
              ),
              itemBuilder: (context, index) {
                final item = subjectList[index];
                return Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: LinearGradient(
                          colors: [
                            (item['color'] as Color).withOpacity(0.15),
                            Colors.white,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: item['color'] as Color,
                            child: Icon(item['icon'] as IconData, color: Colors.white),
                          ),
                          const Spacer(),
                          Text(
                            item['title'] as String,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${allQuestions.where((e) => e.subject == item['title']).length} प्रश्न',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF64748B),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            const Text(
              'आजचे लक्ष्य',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF0F172A),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'आज 30 प्रश्नांची MOCK TEST सोडवा',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'मराठी व्याकरण + इतिहास + संविधान यावर लक्ष केंद्रित करा.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFFCBD5E1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
