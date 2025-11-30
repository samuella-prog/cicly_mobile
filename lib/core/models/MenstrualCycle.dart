class Menstrualcycle {
   final String id ;
   final DateTime periodStartDate;
   final DateTime periodEndDate;
   final DateTime? ovulationDate; 
   final DateTime? pmsStartDate;
   final DateTime? pmsEndDate;  

  Menstrualcycle({
    required this.id,
    required this.periodStartDate,
    required this.periodEndDate,
    this.ovulationDate,
    this.pmsStartDate,
    this.pmsEndDate,
  });

  int get cycleDuration => periodEndDate.difference(periodStartDate).inDays;

  Map<String, dynamic> toMap() =>{
    'id' : id,
    'period_start_date' : periodStartDate.toIso8601String(),
    'period_end_date' : periodEndDate.toIso8601String(),
    'ovulation_date' : ovulationDate?.toIso8601String(),
    'pms_start_date': pmsStartDate?.toIso8601String(),
    'pms_end_date' : pmsEndDate?.toIso8601String(),
    'created_at': DateTime.now().toIso8601String(),
  };

  factory Menstrualcycle.fromMap(Map<String, dynamic> map){
    return Menstrualcycle(id: map['id'], 
    periodStartDate: DateTime.parse(map['period_start_date']), 
    periodEndDate: DateTime.parse(map['period_end_datee']),
    ovulationDate: map['ovulation_date'] != null
      ? DateTime.parse(map['ovulation_date'])
      :null,
    pmsStartDate: map['pms_start_date'] != null
      ? DateTime.parse(map['pms_start_date'])
      : null,
    pmsEndDate: map['pms_end_date'] != null
      ? DateTime.parse(map['pms_end_date'])
      : null,
    );
  }

  static getCycleById(List<Menstrualcycle> cycles, String idCycle) {
    return cycles.firstWhere(
      (cycle) => cycle.id == idCycle,
      orElse: () => throw Exception('Cycle non trouvé pour le cycle l\'ID :$idCycle'),
    );
  }

  // getLastCycle(List<Menstrualcycle> cycles){
  //   if (cycles.isEmpty) return null;
  //   cycles.sort((a, b) => b.endDate.compareTo(a.startDate));
  //   return cycles.first;
  // }
  // // simplet score d'humeur basique
  // int get moodScore {
  //   final positive = ['bien', 'heureux.se', 'énergique', 'stable', 'joyeuse', 'calme'];
  //   final negative = ['triste', 'fatigué.e', 'irritable', 'anxieuse', 'stressé.e','déprimé.e' ];

  //   final mood = moodDescription.toLowerCase();
  //   int score = 0 ; 

  //   for (var word in positive ) {
  //     if (mood.contains(word)) score++; 
  //     {
  //     for (var word in negative) {
  //       if (mood.contains(word)) score--;
  //     }  
  //     }
  //   }
  //   return score.clamp(-5, 5);
  // }

}