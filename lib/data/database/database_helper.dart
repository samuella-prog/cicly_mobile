import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async{
    if (_database != null) return _database!;
    _database = await _initDB('A REMPLACER');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
      onConfigure: _onConfigure,
    );
  }

  Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }
  Future _createDB(Database db, int version) async {
    const idType = 'TEXT PRIMARY KEY';
    const textType = 'TEXT NOT NULL';
    const dateType = 'TEXT NOT NULL'; 

    await db.execute('''
          CREATE TABLE menstrual_cycle(
          id $idType,
          period_start_date $dateType,
          period_end_date $dateType,
          ovulation_end_date TEXT,
          pms_start_date TEXT,
          pms_end_date TEXT,
          created_at $dateType
          )
      ''');
    await db.execute('''
      CREATE TABLE mood(
        id $idType,
        date $dateType,
        mood $textType,
        id_menstrual_cycle $textType,
        created_at $dateType,
        FOREIGN KEY (id_menstrual_cycle)
          REFERENCES menstrual_cycle (id)
          ON DELETE CASCADE
      )
  ''');
      await db.execute('''
        CREATE TABLE symptoms (
        id $idType,
        id_menstrual_cycle $textType,
        name $textType,
        date $dateType,
        created_at $dateType,
        FOREIGN KEY (id_menstrual_cycle)
          REFERENCES menstrual_cycle (id)
          ON DELETE CASCADE
        )
  ''');
      await db.execute('''
        CREATE TABLE contraception(
        id $idType,
        id_menstrual_cycle $textType,
        type $textType,
        date $dateType,
        created_at $dateType,
        FOREIGN KEY (id_menstrual_cycle)
          REFERENCES menstrual_cycle (id)
          ON DELETE CASCADE
        )
''');

    await db.execute('''
        CREATE TABLE diseases (
        id $idType,
        id_List_disease INTEGER NOT NULL,
        created_at $textType
        )
      ''');
    await db.execute('''
        CREATE TABLE menstrual_flow (
          id $idType,
          id_menstrual_cycle $textType,
          flow_date $textType,
          intensity $textType,
          created_at $textType,
          FOREIGN KEY (id_menstrual_cycle)
            REFERENCES menstrual_cycles (id)
              ON DELETE CASCADE
        )
      ''');
    await db.execute('''
      CREATE INDEX idx_cycle_start_date 
      ON menstrual_cycles(period_start_date)
    ''');
    await db.execute('''
      CREATE INDEX idx_mood_cycle 
      ON mood(id_menstrual_cycle)
  ''');
  await db.execute('''
      CREATE INDEX idx_symptoms_cycle 
      ON symptoms(id_menstrual_cycle)
  ''');
    await db.execute('''
      CREATE INDEX idx_flow_cycle 
      ON menstrual_flows(id_menstrual_cycle)
    ''');
    await db.execute('''
      CREATE INDEX idx_contraception_cycle
      ON contraception(id_menstrual_cycle)
  ''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}