import 'dart:convert';
import 'package:cicly/core/models/Diseases.dart';
import 'package:flutter/services.dart';

class DiseaseListLoader {

  static List<Diseases>? _cachedDiseases;

  static Future<List<Diseases>> loadDiseases() async {

    if (_cachedDiseases != null) {
      return _cachedDiseases!;
    }

    try {
      final jsonString = await rootBundle.loadString('lib/assets/data/list_disease.json');

      final List<dynamic> jsonList = json.decode(jsonString);

      _cachedDiseases = jsonList.map((json) => Diseases.fromJson(json)).toList();

      return _cachedDiseases!;
    } catch (e) {
      print('Erreur lors du changement des maladies: $e');
      
      
      return _getDefaultDiseases();
    }
  }

  static Future<Diseases?> getDiseaseById(int id) async {
    final disease = await loadDiseases();

    try {
      return disease.firstWhere((diseases) => diseases.id == id);
    } catch (e) {
      return null;
    }
  }


  static List<Diseases> _getDefaultDiseases() {
    return [

    ];
  }

  static void clearCache(){
    _cachedDiseases = null;
  }


}