import 'dart:convert';

import 'package:oopquiz/Models/quiz_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Topic topicFromJson(String str) => Topic.fromJson(json.decode(str));

String topicToJson(Topic data) => json.encode(data.toJson());

class Topic {
  final int topicId;
  final String name;
  final String description;
  final String imagePath;
  double _progress = 0;

  double get progress => _progress;

  set progress(double value) {
    _progress = value;
  }

  late List<Quiz> _quizzes;

  List<Quiz> get quizzes => _quizzes;

  set quizzes(List<Quiz> value) {
    _quizzes = value;
  }

  Topic(
      {required this.topicId,
      required this.name,
      required this.description,
      required this.imagePath,
      required List<Quiz> quizzes}) {
    _quizzes = quizzes;
    initProgress();
  }

  void initProgress() async {
    _progress = await TopicStoreManager.getTopicProgress(topicId);
  }

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
        quizzes: quizzes ?? this.quizzes,
      );

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
      topicId: json["topic_id"],
      name: json["name"],
      description: json["description"],
      imagePath: json["image_path"],
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

class TopicStoreManager {
  static const String _prefix = 'topic_progress_';

  static Future<void> revalidateProgress(Topic topic) async {
    final prefs = await SharedPreferences.getInstance();
    final double progress = await QuizStoreManager.calculateProgress(topic.quizzes);
    topic.progress = progress ;
    await prefs.setDouble('$_prefix${topic.topicId}', progress);
  }

  static Future<double> getTopicProgress(int topicId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('$_prefix$topicId') ?? 0.0;
  }

  static void setTopicProgress(int topicId, double progress) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('$_prefix$topicId', progress);
  }
}
