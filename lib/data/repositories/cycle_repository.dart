import 'package:cicly/core/models/MenstrualCycle.dart';
import 'package:cicly/data/database/database_helper.dart';
import 'package:uuid/uuid.dart';

class CycleRepository{
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;
  final _uuid = const Uuid();

  Future<String> createCycle(Menstrualcycle cycle) async {
    final db = await _dbHelper.database;
    final cycleId = cycle.id.isEmpty ? _uuid.v4() : cycle.id;

    final cycleWithId = Menstrualcycle(id: cycleId, 
    periodStartDate: cycle.periodStartDate, 
    periodEndDate: cycle.periodEndDate,
    ovulationDate: cycle.ovulationDate,
    pmsStartDate: cycle.pmsStartDate,
    pmsEndDate: cycle.pmsEndDate,
    );

    await db.insert('menstrual_cycle', cycleWithId.toMap());
    return cycleId;
  }

  Future<Menstrualcycle?> getCycleById(String id) async {
    final db = await _dbHelper.database;
    final results = await db.query(
      'menstrual_cycle',
      where: 'id = ?',
      whereArgs: [id],
      );
      if (results.isEmpty) return null;
      return Menstrualcycle.fromMap(results.first);
  }

  Future<List<Menstrualcycle>> getAllCycles() async {
    final db = await _dbHelper.database;
    final results = await db.query('menstrual_cycle', orderBy: 'period_start_date DESC',
    limit: 1,
    );

    return results.map((map) => Menstrualcycle.fromMap(map)).toList();
  }

  Future<Menstrualcycle?> getLastCycle() async {
    final db = await _dbHelper.database; 
    final results = await db.query('menstrual_cycle',
    orderBy: 'period_start_date DESC',
    limit: 1,
    );

    if(results.isEmpty) return null;
    return Menstrualcycle.fromMap(results.first);
  }

  Future<List<Menstrualcycle>> getLastNCycles(int n) async {
    final db = await _dbHelper.database;
    final results = await db.query('menstrual_cycle',
    orderBy: 'period_start_date DESC',
    limit: n,
    );

    return results.map((map)=> Menstrualcycle.fromMap(map)).toList();
  }

  Future<List<Menstrualcycle>> getCyclesDataRange({
    required DateTime start,
    required DateTime end,
  }) async {
    final db = await _dbHelper.database;
    final results = await db.query('menstrual_cycle',
    where: 'period_start_date >= ? AND period_start_date <=?',
    whereArgs: [start.toIso8601String(), end.toIso8601String()],
    orderBy: 'period_start_date DESC',
    );
    return results.map((map) => Menstrualcycle.fromMap(map)).toList();
  }
  Future<int>updateCycle(Menstrualcycle cycle) async{
    final db = await _dbHelper.database;
    return await db.update(
      'menstrual_cycle',
      cycle.toMap(),
      where: 'id = ?',
      whereArgs: [cycle.id],
    );
  }
Future<int> deleteCycle(String id) async {
    final db = await _dbHelper.database;
    return await db.delete(
      'menstrual_cycle',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> getCycleCount() async {
    final db = await _dbHelper.database;
    final result = await db.rawQuery('SELECT COUNT (*) as count FROM menstrual_cycle');

    return result.first['count'] as int;
  }

  Future<bool> hasCycles() async {
    final count = await getCycleCount();
    return count >0;
  }
}