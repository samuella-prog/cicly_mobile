import 'package:uuid/uuid.dart';
import '../database/database_helper.dart';

class OnboardingRepository {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;
  final _uuid = const Uuid();

  Future<String> saveFirstCycle({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final db = await _dbHelper.database;

    final cycleId = _uuid.v4();

    await db.insert('menstrual_cycles', {
      'id' : cycleId,
      'start_date' : startDate.toIso8601String(),
      'end_date': endDate.toIso8601String(),
      'mood_description': '',
      'contraception': 0,
      'count_sexuality': 0,
      'created_at': DateTime.now().toIso8601String(),
    });

    await _createDefautPhases(cycleId);

    return cycleId;
  }

  //Trop simple à améliorer
  Future<void> _createDefautPhases(String cycleId) async{
    final db = await _dbHelper.database;

    for (int phase = 1; phase <= 4; phase++) {
      await db.insert('phases', {
        'id': _uuid.v4(),
        'id_menstrual_cycle': cycleId,
        'phase_cycle': phase,
        'mood_description': null,
        'created_at': DateTime.now().toIso8601String()
      });
    }
  }

  Future<void> saveDiseases(List<int> diseaseIds) async {
    final db = await _dbHelper.database;

    await db.delete('diseases');

    final batch = db.batch();
    for (var diseaseId in diseaseIds){
      batch.insert('diseases', {
        'id': _uuid.v4(),
        'id_list_disease' : diseaseId,
        'created_at': DateTime.now().toIso8601String(),
      });
      await batch.commit(noResult: true);
    }
  }

  Future<bool> isOnboardingCompleted() async {
    final db = await _dbHelper.database;
    final result = await db.query(
      'menstrual_cycles', 
      limit: 1
      );

    return result.isNotEmpty;
  }

  Future<int> getCycleCount() async {
    final db = await _dbHelper.database;
    final result = await db.rawQuery(
      'SELECT COUNT(*) as count FROM menstrual_cycles'
    );
    return result.first['count'] as int;
  }
}