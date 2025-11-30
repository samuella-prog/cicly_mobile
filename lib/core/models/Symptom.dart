class Symptom {
  final String id;
  final String idMenstrualCycle;
  final String name;
  final DateTime date;

  Symptom({
    required this.id,
    required this.idMenstrualCycle,
    required this.name,
    required this.date,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'id_menstrual_cycle': idMenstrualCycle,
    'name': name,
    'date' : date.toIso8601String(),
    'created_at' : DateTime.now().toIso8601String(),
  };

  factory Symptom.fromMap(Map<String, dynamic> map){
    return Symptom(id: map['id'], 
    idMenstrualCycle:map ['idMenstrualCycle'], 
    name: map ['name'], 
    date: DateTime.parse(map['date']),
    );
  }
}