class Menstrualcycle {
   String id ;
   DateTime startDate;
   DateTime endDate;
   String moodDescription; 
   bool contraception ;
   int countSexuality;

  Menstrualcycle({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.moodDescription,
    required this.contraception,
    required this.countSexuality,
  });

  static getCycleById(List<Menstrualcycle> cycles, String idCycle) {
    return cycles.firstWhere(
      (cycle) => cycle.id == idCycle,
      orElse: () => throw Exception('Cycle non trouvé pour le cycle l\'ID :$idCycle'),
    );
  }

  getLastCycle(List<Menstrualcycle> cycles){
    if (cycles.isEmpty) return null;
    cycles.sort((a, b) => b.endDate.compareTo(a.startDate));
    return cycles.first;
  }
  // simplet score d'humeur basique
  int get moodScore {
    final positive = ['bien', 'heureux.se', 'énergique', 'stable', 'joyeuse', 'calme'];
    final negative = ['triste', 'fatigué.e', 'irritable', 'anxieuse', 'stressé.e','déprimé.e' ];

    final mood = moodDescription.toLowerCase();
    int score = 0 ; 

    for (var word in positive ) {
      if (mood.contains(word)) score++; 
      {
      for (var word in negative) {
        if (mood.contains(word)) score--;
      }  
      }
    }
    return score.clamp(-5, 5);
  }

  DateTime get _startDate => startDate;
  DateTime get _endDate => endDate;
  String get _moodDescription => moodDescription;
  bool get _contraception => contraception;
  int get _countSexuality => countSexuality;
  int get _duration => endDate.difference(startDate).inDays;

  set setStartDate(newStartDate) => startDate = newStartDate ; 
  set setEndDate(newEndDate) => endDate = newEndDate;
  set setMoodDescription(newMoodDescription) => moodDescription = newMoodDescription;
  set setContraception(newContraception) => contraception = newContraception;
  set setCountSexuality(newCountSexuality) => countSexuality = newCountSexuality ;


}