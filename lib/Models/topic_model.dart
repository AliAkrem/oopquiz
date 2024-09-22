import 'dart:convert';

import 'package:oopquiz/Models/quiz_model.dart';

Topic topicFromJson(String str) => Topic.fromJson(json.decode(str));

String topicToJson(Topic data) => json.encode(data.toJson());

class Topic {
  final int topicId;
  final String name;
  final String description;
  final String imagePath;
  final double progress;
  final List<Quiz> quizzes;
  Topic(
      {required this.topicId,
      required this.name,
      required this.description,
      required this.imagePath,
      required this.quizzes,
      this.progress = 0.0});

  Topic copyWith(
          {int? topicId,
          String? name,
          String? description,
          String? imagePath,
          double? progress,
          List<Quiz>? quizzes}) =>
      Topic(
        topicId: topicId ?? this.topicId,
        name: name ?? this.name,
        description: description ?? this.description,
        imagePath: imagePath ?? this.imagePath,
        progress: progress ?? this.progress,
        quizzes: quizzes ?? this.quizzes,
      );

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
      topicId: json["topic_id"],
      name: json["name"],
      description: json["description"],
      imagePath: json["image_path"],
      progress: json["progress"] ?? 0.0,
      quizzes: json["quizzes"] ?? []);

  Map<String, dynamic> toJson() => {
        "topic_id": topicId,
        "name": name,
        "description": description,
        "image_path": imagePath,
        "progress": progress,
        "quizzes": quizzes
      };
}
