import 'package:oopquiz/DatabaseHelper/connection.dart';
import 'package:oopquiz/DatabaseHelper/tables.dart';
import 'package:oopquiz/Models/quiz_model.dart';
import 'package:oopquiz/Models/topic_model.dart';

class Repository {
  final DatabaseHelper databaseHelper = DatabaseHelper();

  // Get Topics
  Future<List<Topic>> getAllTopics() async {
    final db = await databaseHelper.initDatabase();
    // final List<Map<String, Object?>> topics =
    //     await db.query(Tables.topicTableName);

    final List<Map<String, Object?>> topics = await db.rawQuery('''
        SELECT t.topic_id, 
            t.name, 
            t.description, 
            t.image_path,
            CASE 
              WHEN COUNT(q.quiz_id) > 0 THEN 
                CAST(COUNT(CASE WHEN q.solved = 1 THEN 1 END) AS FLOAT) / COUNT(q.quiz_id)
              ELSE 1.0
            END AS progress
      FROM ${Tables.topicTableName} AS t
      LEFT JOIN ${Tables.quizTableName} AS q 
        ON t.topic_id = q.topic_id
      GROUP BY t.topic_id;
    ''');

    return topics.map((e) => Topic.fromJson(e)).toList();
  }

  //Get Quizzes
  Future<List<Quiz>> getAllQuizzes({required int topicId}) async {
    final db = await databaseHelper.initDatabase();
    final List<Map<String, Object?>> quizzes = await db.query(
        Tables.quizTableName,
        where: "topic_id = ?",
        whereArgs: [topicId]);
    return quizzes.map((e) => Quiz.fromJson(e)).toList();
  }

  // Update Quiz set solved to true

  Future<int> quizAnswered({required Quiz quiz}) async {
    final db = await databaseHelper.initDatabase();
    // SET solved to true
    return await db.update(
        Tables.quizTableName, quiz.copyWith(solved: true).toJson(),
        where: 'quiz_id = ?', whereArgs: [quiz.quizId]);
  }
}
