import 'package:cicly/core/models/Diseases.dart';
import 'package:cicly/core/models/MenstrualCycle.dart';
import 'package:cicly/core/models/onboarding_data.dart';
import 'package:cicly/data/local/disease_list_loader.dart';
import 'package:cicly/data/repositories/cycle_repository.dart';
import 'package:cicly/data/repositories/disease_repository.dart';
import 'package:cicly/utils/validators.dart';

class OnboardingService {
  final CycleRepository _cycleRepository;
  final DiseaseRepository _diseaseRepository;

  OnboardingService({
    CycleRepository? cycleRepository,
    DiseaseRepository? diseaseRepository,
  })    : _cycleRepository = cycleRepository ?? CycleRepository(),
        _diseaseRepository = diseaseRepository ?? DiseaseRepository();

    ValidationResult validateOnboardingData(OnboardingData data){

      final dateValidation = OnboardingValidators.validatePeriodDates(
        startDate: data.periodEndDate,
        endDate: data.periodStartDate,
      );

      if (data.periodStartDate != null){
        final recencyValidation = OnboardingValidators.validateDateRecency(data.periodStartDate!,
        );

        if (!recencyValidation.isValid) {
          return ValidationResult(
            isValid: true, 
            errors: [], 
            warnings: recencyValidation.errors
          );
        }
      }
      return ValidationResult(isValid: true, errors: []);
    }
  Future<OnboardingResult> completeOnboarding(OnboardingData data) async {
    try {
      final validation = validateOnboardingData(data);
      if (!validation.isValid){
        return OnboardingResult.error(validation.errors);
      }

      String? cycleId;
      if (data.hasPeriodDates){
        final cycle = Menstrualcycle(
          id: '', 
          periodStartDate: data.periodStartDate!, 
          periodEndDate: data.periodEndDate!,
          ovulationDate: null,
          pmsStartDate: null,
          pmsEndDate: null,
          );

          cycleId = await _cycleRepository.createCycle(cycle); 
      }

      if (data.selectedDiseaseIds.isNotEmpty) {
        await _diseaseRepository.saveDiseases(data.selectedDiseaseIds);
      }

      return OnboardingResult.success(
        cycleId: cycleId,
        warnings: validation.warnings,
      );
    } catch (e) {
      return OnboardingResult.error(['Erreur lors de la sauvegarde : $e']);
    }
  }

  Future<bool> isOnboardingCompleted() async {
    return await _cycleRepository.hasCycles();
  }

  Future<List<Diseases>> loadAvailableDiseases() async {
    return await DiseaseListLoader.loadDiseases();
  }

/// Obtenir les IDs des maladies de l'utilisatrice
Future<List<int>> getUserDiseases() async {
  return await _diseaseRepository.getUserDiseaseIds();
}

  DateTime? estimateOvulationDate(DateTime periodStartDate, int cycleDuration) {
    if (cycleDuration < 21) return null;
    return periodStartDate.add(Duration(days: cycleDuration -14 ));
  }
}

class OnboardingResult {
  final bool isSuccess;
  final String? cycleId;
  final List<String> errors;
  final List<String> warnings;

  OnboardingResult._({
    required this.isSuccess,
    this.cycleId,
    this.errors = const [],
    this.warnings = const [],
  });

  factory OnboardingResult.success({
    String? cycleId,
    List<String> warnings = const [],
  }) => OnboardingResult._(
    isSuccess: true , 
    cycleId: cycleId,
    warnings: warnings,
  );

  factory OnboardingResult.error(List<String> errors) =>
      OnboardingResult._(isSuccess: false, errors: errors);

  String? get message {
    if (errors.isNotEmpty) return errors.join('\n');
    if (warnings.isNotEmpty) return warnings.join('\n');
    return null;

  }
}
