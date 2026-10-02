class MpscQuestion {
  final int id;
  final String subject;
  final String chapter;
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  const MpscQuestion({
    required this.id,
    required this.subject,
    required this.chapter,
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });
}
