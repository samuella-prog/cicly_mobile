import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class AppDatabase {
  static final AppDatabase instance = AppDatabase._init();
  static Database? _database;

  AppDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('cicly.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE menstrual_cycle (
        id TEXT PRIMARY KEY,
        period_start_date TEXT NOT NULL, 
        period_end_date TEXT,         
        ovulation_date TEXT,          
        pms_start_date TEXT,          
        pms_end_date TEXT             
      );
    ''');

    await db.execute('''
      CREATE TABLE mood (
        id TEXT PRIMARY KEY,      
        date TEXT NOT NULL,       
        mood TEXT NOT NULL,       
        menstrual_cycle_id TEXT,
        FOREIGN KEY (menstrual_cycle_id)
          REFERENCES menstrual_cycle(id)
          ON DELETE CASCADE
      );
    ''');

    await db.execute('''
      CREATE TABLE symptom (
        id TEXT PRIMARY KEY,
        menstrual_cycle_id TEXT,
        name TEXT NOT NULL,
        date TEXT NOT NULL,
        FOREIGN KEY (menstrual_cycle_id)
          REFERENCES menstrual_cycle(id)
          ON DELETE CASCADE
      );
    ''');

    await db.execute('''
      CREATE TABLE localLikes (
      id TEXT PRIMARY KEY,        
      idArticles TEXT NOT NULL    
      );
    ''');

    await db.execute('''
      CREATE TABLE diseases (
      id TEXT PRIMARY KEY,          
      idListDisease INTEGER NOT NULL 
      );
    ''');
  }
}
