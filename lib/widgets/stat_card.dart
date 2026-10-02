import 'package:flutter/material.dart';
import 'package:mpsc_katta/models/question.dart';

class ResultScreen extends StatelessWidget {
  final List<MpscQuestion> questions;
  final List<int?> selectedAnswers;
  final int score;

  const ResultScreen({
    super.key,
    required this.questions,
    required this.selectedAnswers,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    final total = questions.length;
    final percentage = (score / total * 100).round();

    return Scaffold(
      appBar: AppBar(
        title: const Text('परिणाम'),
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
                children: [
                  const Text(
                    'तुमचे परिणाम',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '$score/$total',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '$percentage% स्कोअर',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'प्रत्येक प्रश्नाचे तपशील',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 12),
            ...List.generate(questions.length, (index) {
              final question = questions[index];
              final selected = selectedAnswers[index];
              final isCorrect = selected == question.correctIndex;

              return Container(
                margin: const EdgeInsets.only(bottom: 14),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${index + 1}. ${question.question}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'तुमची निवड: ${selected == null ? 'नको' : question.options[selected]}',
                      style: TextStyle(
                        color: isCorrect ? const Color(0xFF0F766E) : const Color(0xFFDC2626),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'उत्पन्न उत्तर: ${question.options[question.correctIndex]}',
                      style: const TextStyle(color: Color(0xFF475569)),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'स्पष्टीकरण: ${question.explanation}',
                      style: const TextStyle(color: Color(0xFF475569)),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
