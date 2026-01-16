import 'package:sqflite_sqlcipher/sqflite.dart';
import 'package:path/path.dart';

import '../../security/database_key_provider.dart';

class LocalDatabase {
  static final LocalDatabase instance = LocalDatabase._init();
  static Database? _database;

  static const String _dbName = 'cicly_secure.db';

  LocalDatabase._init();

  /// Returns the existing database instance or initializes it.
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB(_dbName);
    return _database!;
  }

  /// Initializes the encrypted SQLCipher database.
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    // Retrieve or generate the encryption key stored in secure storage.
    final dbKey = await DatabaseKeyProvider.getOrCreateKey();

    return openDatabase(
      path,
      version: 1,
      password: dbKey,
      onConfigure: _configureDB,
      onCreate: _createDB,
      // onUpgrade: _upgradeDB, // Enable when schema evolution is needed.
    );
  }

  /// Configures the database before opening it.
  Future<void> _configureDB(Database db) async {
    // Ensure foreign key constraints are enforced.
    await db.execute('PRAGMA foreign_keys = ON');
  }

  /// Creates all database tables.
  Future<void> _createDB(Database db, int version) async {
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

  /*
  Future<void> _upgradeDB(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      // Example: ALTER TABLE menstrual_cycle ADD COLUMN notes TEXT;
    }
  }
  */

  /// Closes the database connection.
  Future<void> close() async {
    final db = _database;
    if (db != null) {
      await db.close();
      _database = null;
    }
  }

  /// Deletes the encrypted database and the encryption key.
  /// This is required because after deleting the key, the database becomes unreadable.
  Future<void> resetDatabase() async {
    // 1. Close the database if open
    await close();

    // 2. Delete the physical encrypted file
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);
    await deleteDatabase(path);

    // 3. Delete the encryption key
    await DatabaseKeyProvider.deleteKey();

    // 4. Reinitialize the database
    await database;
  }
}
