import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

Quiz quizFromJson(String str) => Quiz.fromJson(json.decode(str));

String quizToJson(Quiz data) => json.encode(data.toJson());

class Quiz {
  final String quizTag;
  final String quizId;
  final String questionContent;
  final List<String> answers;
  final int correctAnswer;
  // final int topicId;
  final String details;
  late bool solved;

  Quiz(
      {required this.quizTag,
      required this.quizId,
      required this.questionContent,
      required this.answers,
      required this.correctAnswer,
      // required this.topicId,
      required this.details}) {
    SharedPreferences.getInstance().then(
      (prefs) {
        if (!prefs.containsKey(quizId)) {
          prefs.setBool(quizId, solved);
          solved = false;
        } else {
          solved = prefs.getBool(quizId) ?? false;
        }
      },
    );
  }

  Future<void> saveQuizSolvedStatusTrue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(quizId, true);
  }

  Quiz copyWith(
          {String? quizTag,
          String? quizId,
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
