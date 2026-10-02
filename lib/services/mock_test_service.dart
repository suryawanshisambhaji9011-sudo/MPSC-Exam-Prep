class AnalyticsService {
  static calculateSubjectAccuracy(String subject, List<Map<String, dynamic>> answers) {
    int correct = 0;
    int total = answers.length;
    
    for (var answer in answers) {
      if (answer['isCorrect'] == true) {
        correct++;
      }
    }
    
    return total > 0 ? (correct / total * 100).toStringAsFixed(1) : '0.0';
  }

  static calculateOverallAccuracy(List<Map<String, dynamic>> allAnswers) {
    int correct = 0;
    int total = allAnswers.length;
    
    for (var answer in allAnswers) {
      if (answer['isCorrect'] == true) {
        correct++;
      }
    }
    
    return total > 0 ? (correct / total * 100).round() : 0;
  }

  static getWeakAreas(Map<String, List<Map<String, dynamic>>> subjectAnswers) {
    List<Map<String, dynamic>> weakAreas = [];
    
    subjectAnswers.forEach((subject, answers) {
      int correct = answers.where((a) => a['isCorrect'] == true).length;
      int accuracy = (correct / answers.length * 100).round();
      
      if (accuracy < 80) {
        weakAreas.add({
          'subject': subject,
          'accuracy': accuracy,
        });
      }
    });
    
    weakAreas.sort((a, b) => a['accuracy'].compareTo(b['accuracy']));
    return weakAreas;
  }

  static getStudyRecommendations(List<Map<String, dynamic>> weakAreas) {
    List<String> recommendations = [];
    
    for (var area in weakAreas) {
      recommendations.add(
        '${area['subject']} विषयावर अधिक लक्ष केंद्रित करा (${area['accuracy']}% अचूकता)',
      );
    }
    
    return recommendations;
  }
}
