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
    const intType = 'INTEGER NOT NULL';
    const boolType = 'BOOL NOT NULL'; 

    await db.execute('''
          CREATE TABLE menstrual_cycles(
          id $idType,
          start_date $textType,
          end_date $textType,
          mood_description TEXT,
          contraception $boolType,
          count_sexuality $intType DEFAULT 0,
          created_at $textType
          )
      ''');

    await db.execute('''
        CREATE TABLE diseases (
        id $idType,
        id_List_disease $intType,
        created_at $textType
        )
      ''');
    await db.execute('''
        CREATE TABLE menstrual_flows (
          id $idType,
          id_menstrual_cycle $textType,
          flow_date $textType,
          intensity $textType,
          protection_changes INTEGER,
          clots $boolType,
          created_at $textType,
          FOREIGN KEY (id_menstrual_cycle)
            REFERENCES menstrual_cycles (id)
              ON DELETE CASCADE
        )
      ''');
    await db.execute('''
      CREATE INDEX idx_cycle_start_date 
      ON menstrual_cycles(start_date)
    ''');
    await db.execute('''
      CREATE INDEX idx_flow_cycle 
      ON menstrual_flows(id_menstrual_cycle)
    ''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}