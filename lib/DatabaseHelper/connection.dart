import 'package:oopquiz/DatabaseHelper/tables.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  final databaseName = "quizapp4.db";

  Future<Database> initDatabase() async {
    final databasePath = await getApplicationDocumentsDirectory();
    final path = join(databasePath.path, databaseName);
    return openDatabase(path, version: 1, onCreate: (db, version) async {
      //! lunch schema creation
      await db.execute(Tables.topicTable);
      await db.execute(Tables.quizTable);
      //! lunch seeds
      await db.execute(Tables.topicSeed);
    });
  }
}
