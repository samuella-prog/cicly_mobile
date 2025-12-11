import 'package:cicly/core/models/Mood.dart';
import 'package:cicly/data/database/database_helper.dart';
import 'package:uuid/uuid.dart';

class MoodRepository {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;
  final _uuid = const Uuid();

  Future<String> addMood(Mood mood) async {
    final db = await _dbHelper.database;
    final moodId = mood.id.isEmpty ? _uuid.v4() : mood.id ;

    final moodWithId = Mood(id: moodId, 
    date: mood.date,
    mood: mood.mood,
    idMenstrualCycle: mood.idMenstrualCycle,
    );

    await db.insert('mood', moodWithId.toMap());
    return moodId;
  }

  Future<List<Mood>> getMoodByMenstrualCycle(String cycleId) async {
    final db = await _dbHelper.database;
    final results = await db.query('mood',
    where: 'id_menstrual_cycle = ?',
    whereArgs: [cycleId],
    orderBy: 'date ASC',
    );
    return results.map((map) => Mood.fromMap(map)).toList();
  }

  Future<Mood?> getMoodByDate(DateTime date) async {
    final db = await _dbHelper.database;
    final dateStr = date.toIso8601String().split('T')[0];

    final results = await db.query('mood',
    where: 'id_menstrual_cycle = ?',
    whereArgs: ['$dateStr%'],
    limit: 1,
    );
    if (results.isEmpty) return null;
    return Mood.fromMap(results.first);
  }

  Future<List<Mood>> getAllMoods() async {
    final db = await _dbHelper.database;
    final results = await db.query('mood',
    orderBy: 'date DESC',
    );
    return results.map((map) => Mood.fromMap(map)).toList();
  }

  Future<int> updateMood(Mood mood) async {
    final db = await _dbHelper.database;
    return await db.update('mood', mood.toMap(),
    where: 'id = ?',
    whereArgs: [mood.id],
    );
  }

  Future<int> deleteMood(String id) async{
    final db = await _dbHelper.database;
    return await db.delete(
      'mood',
      where: 'date >= ? AND date <= ?',
      whereArgs: [id],
      );
  }

  Future<List<Mood>> getMoodsByDateRange({
    required DateTime start,
    required DateTime end,
  }) async {
    final db = await _dbHelper.database;
    final results = await db.query('mood',
    where: 'date >= ? AND date <= ?',
    whereArgs: [start.toIso8601String(), end.toIso8601String()],
    orderBy: 'date ASC',
    );

    return results.map((map) => Mood.fromMap(map)).toList();
  }
  Future<int> setMood(String moodId, String newMood, DateTime newDate) async {
    final db = await _dbHelper.database;
    return await db.update(
      'mood', 
      {'mood' : newMood,
      'date' : newDate.toIso8601String(),
      },
      where: 'id = ?',
      whereArgs: [moodId],
      );
  }
  Future<int> setMenstrualCycle(String moodId, String newCycleId) async {
    final db = await _dbHelper.database;
    return await db.update(
      'mood', {'id_menstrual_cycle' : newCycleId},
      where: 'id = ?',
      whereArgs: [moodId],
    );
  }

  Future<List<String>> getCommonsMood() async {
    return [];
  }
}