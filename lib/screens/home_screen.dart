import 'package:flutter/material.dart';
import 'package:mpsc_katta/data/mock_questions.dart';

class SubjectScreen extends StatelessWidget {
  const SubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chapters = {
      'मराठी': ['व्याकरण', 'साहित्य', 'उपसर्ग-प्रत्यय', 'शब्दरचना'],
      'इतिहास': ['महाराष्ट्राचा इतिहास', 'स्वातंत्र्यलढा', 'मध्ययुगीन इतिहास'],
      'भूगोल': ['भारताचे स्थलरूप', 'हवामान', 'नद्��ा', 'उत्पादन'],
      'भारतीय संविधान': ['मूलभूत हक्क', 'संस्था', 'अधिकार आणि कर्तव्ये'],
      'अर्थशास्त्र': ['व्यापार', 'बँकिंग', 'सरकारी नीति', 'अर्थव्यवस्था'],
      'विज्ञान': ['जीवशास्त्र', 'भौतिकशास्त्र', 'रसायनशास्त्र', 'खगोलशास्त्र'],
      'तर्कशास्त्र': ['मानसिक क्षमता', 'संबंध', 'विषय-प्रकरण'],
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('विषय व प्रकरणे'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: chapters.entries.map((entry) {
            final subject = entry.key;
            final subjectQuestions = allQuestions.where((q) => q.subject == subject).length;
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
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
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0F766E).withOpacity(0.12),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          '$subjectQuestions प्रश्न',
                          style: const TextStyle(
                            color: Color(0xFF0F766E),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: entry.value.map((chapter) {
                      return Chip(
                        label: Text(chapter),
                        backgroundColor: const Color(0xFFF8FAFC),
                        labelStyle: const TextStyle(
                          color: Color(0xFF1E293B),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
