// import 'dart:math';

class Menstrualcycle {
  final String id ;
  final DateTime startDate;
  final DateTime endDate;
  final String moodDescription; 
  final bool contraception ;
  final int countSexuality;

  Menstrualcycle({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.moodDescription,
    required this.contraception,
    required this.countSexuality,
  });

  int get duration => endDate.difference(startDate).inDays;

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
}