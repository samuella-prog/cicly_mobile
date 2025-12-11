import 'dart:convert';

import 'package:cicly/core/models/Symptom.dart';
import 'package:flutter/services.dart';
class SymptomListLoader {

  static List<Symptom>?  _haveSymptoms; 

  static Future<List<Symptom>> loadSymptoms() async {

    if(_haveSymptoms != null) {
      return _haveSymptoms!;
    }

    try {
      final jsonString = await rootBundle.loadString('lib/assets/list_symptoms.json');

      final List<dynamic> jsonList = json.decode(jsonString);

      _haveSymptoms = jsonList.map((json) => Symptom.fromJson(json)).toList();

      return _haveSymptoms!;
    } catch (e) {
      print('Erreur lors du chargement des symptomes : $e');

      return _getDefaultSymptoms();
      
    }
  }

  static Future<Symptom?> getSymptomById(int id) async {
    final symptom = await loadSymptoms();

    try {
      return symptom.firstWhere((symptom) => symptom.id == id);
    } catch (e) {
      return null;
    }
  }

  static List<Symptom> _getDefaultSymptoms(){
    return [];
  }
}