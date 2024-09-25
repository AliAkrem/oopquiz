import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

Quiz quizFromJson(String str) => Quiz.fromJson(json.decode(str));

String quizToJson(Quiz data) => json.encode(data.toJson());

class Quiz {
  final String quizTag;
  final int quizId;
  final String questionContent;
  final List<String> answers;
  final int correctAnswer;
  final String details;
  late bool solved;

  Quiz(
      {required this.quizTag,
      required this.quizId,
      required this.questionContent,
      required this.answers,
      required this.correctAnswer,
      required this.details,
      this.solved = false});

  Quiz copyWith(
          {String? quizTag,
          int? quizId,
          String? questionContent,
          List<String>? answers,
          int? correctAnswer,
          // int? topicId,
          String? details,
          bool? solved}) =>
      Quiz(
        quizTag: quizTag ?? this.quizTag,
        quizId: quizId ?? this.quizId,
        questionContent: questionContent ?? this.questionContent,
        answers: answers ?? this.answers,
        correctAnswer: correctAnswer ?? this.correctAnswer,
        // topicId: topicId ?? this.topicId,
        details: details ?? this.details,
      );

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        quizTag: json["quiz_tag"],
        quizId: json["quiz_id"],
        questionContent: json["question_content"],
        answers: json["answers"],
        correctAnswer: json["correct_answer"],
        // topicId: json["topic_id"],
        details: json["details"],
      );

  Map<String, dynamic> toJson() => {
        "quiz_tag": quizTag,
        "quiz_id": quizId,
        "question_content": questionContent,
        "answers": answers,
        "correct_answer": correctAnswer,
        // "topic_id": topicId,
        "details": details,
        "solved": solved,
      };
}

class QuizStoreManager {
  static const String _prefix = 'quiz_solved_';

  static Future<void> saveQuizStatus(int quizId, bool isSolved) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('$_prefix$quizId', isSolved);


  }

  static Future<bool> getQuizStatus(String quizId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('$_prefix$quizId') ?? false;
  }

  static Future<List<Quiz>> getQuizzesWithStatus(List<Quiz> quizzes) async {
    for (var quiz in quizzes) {
      quiz.solved = await getQuizStatus("${quiz.quizId}");
    }
    return quizzes;
  }

  static Future<double> calculateProgress(List<Quiz> quizzes) async {
    double p = 0;
    for (var quiz in quizzes) {
      if (quiz.solved == true) {
        p++;
      }
    }
    if (quizzes.isNotEmpty) {
      return p / quizzes.length;
    } else {
      return 0;
    }
  }
}
