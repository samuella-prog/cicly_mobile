class Contraception {
  final String id;
  final String idMenstrualCycle;
  final String type;
  final String? dailyInTake ; // en format hh:mm
  final DateTime? renewal;

  Contraception({
    required this.id,
    required this.idMenstrualCycle,
    required this.type,
    this.dailyInTake,
    this.renewal,
  });

  Map<String, dynamic> toMap() => {
    'id' : id,
    'id_menstrual_cycle': idMenstrualCycle,
    'type': type,
    'daily_in_take': dailyInTake,
    'renewal': renewal,
    'created_at' : DateTime.now().toIso8601String(),
  };

  factory Contraception.fromMap(Map<String, dynamic> map){
    return Contraception(id: map['id'], 
    idMenstrualCycle:map ['idMenstrualCycle'], 
    type:map ['type'], 
    dailyInTake: map['daily_in_take'], 
    renewal: map['renewal'] != null 
          ? DateTime.parse(map['renewal']) 
          : null,
  );
  }
}