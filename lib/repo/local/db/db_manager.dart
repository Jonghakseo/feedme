import 'package:async/async.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBManager {
  /// constants
  static const String _dbFileName = 'feed_me.db';

  /// 싱글톤
  static final DBManager _dbManager = DBManager._internal();

  DBManager._internal();

  static DBManager get instance => _dbManager;

  /// Member
  static Database? _database;
  final _initDBMemoizer = AsyncMemoizer<Database>();

  Future<Database> get database async {
    if (_database != null) return _database!;

    Database initializedDB = await _initDBMemoizer.runOnce(() async {
      return await _initDB();
    });

    _database = initializedDB;

    return initializedDB;
  }

  Future<Database> _initDB() async {
    String dbPath = await getDatabasesPath();
    String dbFilePath = join(dbPath, _dbFileName);
    String query = '';
    return await openDatabase(dbFilePath,
        onCreate: (db, version) => db.execute(query), version: 1);
  }
}
