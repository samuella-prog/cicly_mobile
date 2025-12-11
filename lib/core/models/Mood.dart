//import 'MenstrualCycle.dart';
class Mood {
  String id; 
  DateTime date;
  String mood;
  String idMenstrualCycle;

  Mood({
    required this.id,
    required this.date,
    required this.mood,
    required this.idMenstrualCycle,
  });

  Map<String, dynamic> toMap() =>{
    'id': id,
    'date': date.toIso8601String(),
    'mood': mood,
    'id_menstrual_cycle': idMenstrualCycle,
    'created_at' : DateTime.now().toIso8601String(),
  };
  factory Mood.fromMap(Map<String, dynamic> map){
    return Mood(id: map['id'], 
      date: DateTime.parse(map['date']), mood: map['mood'], 
      idMenstrualCycle: map['idMenstrualCycle'],
    );
  }
}