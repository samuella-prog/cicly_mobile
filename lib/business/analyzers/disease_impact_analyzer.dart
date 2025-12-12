//import 'package:cicly/data/local/disease_list_loader.dart';
import 'package:cicly/data/repositories/disease_repository.dart';

class DiseaseImpactAnalyzer {
  final DiseaseRepository _repository;

  DiseaseImpactAnalyzer({DiseaseRepository? repository})
      : _repository = repository ?? DiseaseRepository();

  Future<IrregularityRisk> assessIrregularityRisk() async {
    final userDiseaseIds = await _repository.getAllMyDiseases();
    if (userDiseaseIds.isEmpty) return IrregularityRisk.low;

    const highRiskDiseases = [1, 2, 3, 4, 5, 10];
    final hasHighRisk =
        userDiseaseIds.any((id) => highRiskDiseases.contains(id));

    return hasHighRisk ? IrregularityRisk.high : IrregularityRisk.medium;
  }

  Future<SymptomSeverityRisk> assessSymptomSeverityRisk() async {
    final userDiseaseIds = await _repository.getAllMyDiseases();
    if (userDiseaseIds.isEmpty) return SymptomSeverityRisk.normal;

    const severeSymptomDiseases = [2, 3, 9, 11];
    final hasSevere =
        userDiseaseIds.any((id) => severeSymptomDiseases.contains(id));

    return hasSevere ? SymptomSeverityRisk.high : SymptomSeverityRisk.normal;
  }

//   Future<List<String>> getPersonalizedRecommendations() async {
//   final userDiseaseIds = await _repository.getUserDiseaseIds();
//   if (userDiseaseIds.isEmpty) return [];

//   final diseases = <Diseases>[];

//   for (final id in userDiseaseIds) {
//     final disease = await DiseaseListLoader.getDiseaseById(id);
//     if (disease != null) diseases.add(disease);
//   }

//   final recommendations = <String>[];

//   for (var disease in diseases) {
//     switch (disease.id) {
//       case 1:
//         recommendations.add(
//           'Avec le SOPK, vos cycles peuvent être irréguliers. '
//           'L’app ajustera ses prédictions en conséquence.',
//         );
//         break;
//       case 2:
//         recommendations.add(
//           'L’endométriose peut augmenter la sévérité de vos symptômes. '
//           'N’hésitez pas à consulter un professionnel de santé si besoin.',
//         );
//         break;
//       case 4:
//         recommendations.add(
//           'L’hypothyroïdie peut allonger vos cycles. '
//           'Assurez-vous de prendre votre traitement régulièrement.',
//         );
//         break;
//       case 7:
//         recommendations.add(
//           'Avec l’anémie, surveillez votre niveau de fatigue pendant les règles.',
//         );
//         break;
//       case 9:
//         recommendations.add(
//           'Les règles douloureuses sont courantes. '
//           'Notez leur intensité pour identifier d’éventuels patterns.',
//         );
//         break;
//     }
//   }

//   return recommendations;
// }


  Future<CycleLengthAdjustment> estimateCycleLengthImpact() async {
    final userDiseaseIds = await _repository.getAllMyDiseases();

    if (userDiseaseIds.contains(1)) {
      return CycleLengthAdjustment(
        adjustmentDays: 7,
        confidence: 0.7,
        reason: 'Le SOPK tend à allonger les cycles.',
      );
    }

    if (userDiseaseIds.contains(4)) {
      return CycleLengthAdjustment(
        adjustmentDays: 3,
        confidence: 0.6,
        reason: 'L’hypothyroïdie peut allonger légèrement les cycles.',
      );
    }

    return CycleLengthAdjustment(
      adjustmentDays: 0,
      confidence: 1.0,
      reason: 'Aucun impact connu sur la durée des cycles.',
    );
  }
}

enum IrregularityRisk { low, medium, high }
enum SymptomSeverityRisk { normal, high }

class CycleLengthAdjustment {
  final int adjustmentDays;
  final double confidence;
  final String reason;

  CycleLengthAdjustment({
    required this.adjustmentDays,
    required this.confidence,
    required this.reason,
  });
}
