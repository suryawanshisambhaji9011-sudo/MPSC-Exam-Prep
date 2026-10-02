import 'package:flutter/material.dart';
import 'package:mpsc_katta/data/mock_questions.dart';
import 'package:mpsc_katta/models/question.dart';
import 'package:mpsc_katta/screens/result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String? subject;

  const QuizScreen({super.key, this.subject});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late final List<MpscQuestion> _questions;
  final List<int?> _selectedAnswers = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.subject == null || widget.subject!.isEmpty) {
      _questions = List<MpscQuestion>.from(allQuestions.take(10));
    } else {
      _questions = allQuestions
          .where((question) => question.subject == widget.subject)
          .toList();
      if (_questions.isEmpty) {
        _questions = List<MpscQuestion>.from(allQuestions.take(10));
      }
    }

    _selectedAnswers.addAll(List<int?>.filled(_questions.length, null));
  }

  MpscQuestion get currentQuestion => _questions[_currentIndex];

  bool get isLastQuestion => _currentIndex == _questions.length - 1;

  void _selectAnswer(int index) {
    setState(() {
      _selectedAnswers[_currentIndex] = index;
    });
  }

  void _nextQuestion() {
    if (isLastQuestion) {
      _submitQuiz();
      return;
    }

    setState(() {
      _currentIndex += 1;
    });
  }

  void _submitQuiz() {
    int correct = 0;
    for (int i = 0; i < _questions.length; i++) {
      if (_selectedAnswers[i] == _questions[i].correctIndex) {
        correct += 1;
      }
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => ResultScreen(
          questions: _questions,
          selectedAnswers: _selectedAnswers,
          score: correct,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subject ?? 'MOCK TEST'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'प्रश्न ${_currentIndex + 1}/${_questions.length}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0F766E).withOpacity(0.12),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      currentQuestion.subject,
                      style: const TextStyle(
                        color: Color(0xFF0F766E),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentQuestion.chapter,
                        style: const TextStyle(
                          color: Color(0xFF64748B),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        currentQuestion.question,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0F172A),
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ...List.generate(currentQuestion.options.length, (index) {
                        final isSelected = _selectedAnswers[_currentIndex] == index;
                        return GestureDetector(
                          onTap: () => _selectAnswer(index),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFF0F766E).withOpacity(0.12)
                                  : const Color(0xFFF8FAFC),
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFF0F766E)
                                    : const Color(0xFFE2E8F0),
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  '${String.fromCharCode(65 + index)}.',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF0F172A),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    currentQuestion.options[index],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFF1E293B),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0F766E),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: _nextQuestion,
                  child: Text(isLastQuestion ? 'Submit' : 'पुढील प्रश्न'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
