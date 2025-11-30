class Contraception {
  final String id;
  final String idMenstrualCycle;
  final String type;
  final DateTime date;

  Contraception({
    required this.id,
    required this.idMenstrualCycle,
    required this.type,
    required this.date,
  });

  Map<String, dynamic> toMap() => {
    'id' : id,
    'id_menstrual_cycle': idMenstrualCycle,
    'type': type,
    'date': date.toIso8601String(),
    'created_at' : DateTime.now().toIso8601String(),
  };

  factory Contraception.fromMap(Map<String, dynamic> map){
    return Contraception(id: map['id'], 
    idMenstrualCycle:map ['idMenstrualCycle'], 
    type:map ['type'], 
    date: DateTime.parse(map['date']),
  );
  }
}