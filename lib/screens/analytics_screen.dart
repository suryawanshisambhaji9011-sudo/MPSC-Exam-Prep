import 'package:mpsc_katta/models/question.dart';
import 'package:mpsc_katta/data/mock_questions.dart';

class MockTestService {
  static List<MpscQuestion> generateMockTest({
    int numberOfQuestions = 30,
    String? subject,
    String? difficulty,
  }) {
    List<MpscQuestion> filteredQuestions = List.from(allQuestions);
    
    // Filter by subject if provided
    if (subject != null && subject.isNotEmpty) {
      filteredQuestions = filteredQuestions
          .where((q) => q.subject == subject)
          .toList();
    }
    
    // Filter by difficulty if provided
    if (difficulty != null && difficulty.isNotEmpty) {
      filteredQuestions = filteredQuestions
          .where((q) => q.difficulty == difficulty)
          .toList();
    }
    
    // Shuffle and take required number
    filteredQuestions.shuffle();
    return filteredQuestions.take(numberOfQuestions).toList();
  }

  static List<MpscQuestion> getQuestionsBySubject(String subject) {
    return allQuestions.where((q) => q.subject == subject).toList();
  }

  static List<MpscQuestion> getQuestionsByChapter(String subject, String chapter) {
    return allQuestions
        .where((q) => q.subject == subject && q.chapter == chapter)
        .toList();
  }

  static List<String> getAllSubjects() {
    return allQuestions.map((q) => q.subject).toSet().toList();
  }

  static List<String> getChaptersBySubject(String subject) {
    return allQuestions
        .where((q) => q.subject == subject)
        .map((q) => q.chapter)
        .toSet()
        .toList();
  }
}
