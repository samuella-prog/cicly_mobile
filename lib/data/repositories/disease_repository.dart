import 'package:cicly/core/models/Diseases.dart';
import 'package:cicly/data/database/database_helper.dart';
import 'package:cicly/data/local/disease_list_loader.dart';
import 'package:uuid/uuid.dart';

class DiseaseRepository {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;
  final _uuid = const Uuid();

  Future<void> saveDiseases(List<int> diseaseIds) async {
    final db = await _dbHelper.database;

    await db.delete('diseases');

    if (diseaseIds.isEmpty) return;

    final batch = db.batch();

    for(var diseaseId in diseaseIds){
      batch.insert('diseasses', {
        'id': _uuid.v4(),
        'id_list_disease': diseaseId,
        'created_at': DateTime.now().toIso8601String(),
      });
    }
    await batch.commit(noResult: true);
  }

  Future<String> addDisease(int diseaseId) async {
    final db = await _dbHelper.database;
    final id = _uuid.v4();

    await db.insert('diseases', {
      'id': id,
      'id_list_disease': diseaseId,
      'created_at': DateTime.now().toIso8601String(),
    });

    return id;
  }

  Future<List<int>> getUserDiseaseIds() async {
    final db = await _dbHelper.database;
    final results = await db.query('diseases');

    return results.map((map) => map['id_list_disease'] as int).toList();
  }
  Future<List<int>> getAllMyDiseases() async {
    final db = await _dbHelper.database;
    final results = await db.query('diseases');
    return results.map((map) => map['id_list_disease'] as int).toList();
  }

  Future<bool> hasDisease(int diseaseId) async {
    final diseases = await getUserDiseaseIds();
    return diseases.contains(diseaseId);
  }

  Future<int> removeDisease(int diseaseId) async{
    final db = await _dbHelper.database;

    return await db.delete('diseases',
    where: 'id_list_disease = ?',
    whereArgs: [diseaseId] ,
    );
  }

  Future<int> clearAllDiseases() async {
    final db = await _dbHelper.database; 
    return await db.delete('diseases');
  }

  Future<int> getDiseaseCount() async {
    final db = await _dbHelper.database;
    final result = await db.rawQuery('SELECT COUNT (*) FROM diseases');

    return result.first['count'] as int;
  }
  Future<List<Diseases>> getAllDiseases() async {
  // Charge TOUTES les maladies du JSON (pas celles de l'utilisatrice)
  return await DiseaseListLoader.loadDiseases();
}

}