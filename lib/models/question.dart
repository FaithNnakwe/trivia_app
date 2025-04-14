import 'package:html_unescape/html_unescape.dart';

class Question {
  static final unescape = HtmlUnescape();

  final String question;
  final List<String> options;
  final String correctAnswer;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    // Decode HTML entities in the question and answers using unescape.convert
    String questionText = unescape.convert(json['question']);
    String correctAnswer = unescape.convert(json['correct_answer']);
    List<String> incorrectAnswers = List<String>.from(json['incorrect_answers'])
        .map((answer) => unescape.convert(answer))
        .toList();

    // Combine incorrect answers with the correct answer and shuffle
    List<String> options = [...incorrectAnswers, correctAnswer]..shuffle();

    return Question(
      question: questionText,
      options: options,
      correctAnswer: correctAnswer,
    );
  }
}

