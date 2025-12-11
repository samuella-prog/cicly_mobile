import 'package:cicly/core/models/Symptom.dart';
import 'package:cicly/data/database/database_helper.dart';
import 'package:uuid/uuid.dart';

class SymptomRepository {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;
  final _uuid = const Uuid();

  Future<String> addSymptom(Symptom symptom) async {
    final db = await _dbHelper.database;
    final symptomId = symptom.id.isEmpty ? _uuid.v4() : symptom.id ;

    final symptomWithId = Symptom(
      id: symptomId,
      idMenstrualCycle: symptom.idMenstrualCycle,
      name: symptom.name,
      date: symptom.date,
    );

    await db.insert('symptoms', symptomWithId.toMap());
    return symptomId;
  }

  Future<List<Symptom>> getSymptomsByMenstrualCycle(String cycleId) async {
    final db = await _dbHelper.database;
    final results = await db.query('symptoms',
    where: 'id_menstrual_cycle = ?',
    whereArgs: [cycleId],
    orderBy: 'date ASC',
    );

    return results.map((map) => Symptom.fromMap(map)).toList();
  }

  Future<List<Symptom>> getSymptomByDate(DateTime date) async{
    final db = await _dbHelper.database;
    final dateStr = date.toIso8601String().split('T')[0];

    final results = await db.query(
      'symptoms',
      where: 'date LIKE ?',
      whereArgs: ['$dateStr%'],
    );
    return results.map((map) => Symptom.fromMap(map)).toList();
  }
  Future<List<Symptom>> getAllSymptoms() async {
    final db = await _dbHelper.database;
    final results = await db.query('symptoms',
    orderBy: 'date DESC');

    return results.map((map) => Symptom.fromMap(map)).toList();
  }

  Future<List<Symptom>> getSymptomsByName(String name) async {
    final db = await _dbHelper.database;
    final results = await db.query('symptoms',where: 'name = ?', orderBy: 'date DESC',);

    return results.map((map) => Symptom.fromMap(map)).toList();
  }

  Future<List<String>> getUniqueSymptomNames() async {
    final db = await _dbHelper.database;
    final results = await db.rawQuery('SELECT DISTINCT name FROM symptoms ORDER BY name ASC');

    return results.map((map) => map['name'] as String).toList();
  }

  Future<int> deleteSymptom(String id) async {
    final db = await _dbHelper.database;
    return await db.delete('symptoms', where: 'id = ?', whereArgs: [id],
    );
  }

  Future<List<Symptom>> getSymptomsBetweenDate({
    required DateTime start,
    required DateTime end,
  }) async {
    final db = await _dbHelper.database;
    final results = await db.query('symptoms',
    where: 'date >= ? AND date <= ?',
    whereArgs: [start.toIso8601String(), end.toIso8601String()],
    orderBy: 'date ASC',
    );
    return results.map((map) => Symptom.fromMap(map)).toList();
  }

  Future<int> getSymptomFrequency(String symptomName) async {
    final db = await _dbHelper.database;
    final result = await db.rawQuery('SELECT COUNT(*) FROM symptoms WHERE name = ?',
    [symptomName],
    );
    return result.first['count'] as int;
  }
  
}