import 'package:cicly/business/validators/onboarding_validator.dart';

class OnboardingValidators{

  static ValidationResult validatePeriodDates({
    required DateTime? startDate,
    required DateTime? endDate,
  }) {
    List<String> errors = [];

    if (startDate == null){
      errors.add('La date de début des règles est obligatoire');
      return ValidationResult(isValid: false, errors: errors);
    }
    if (endDate == null) {
      errors.add('La date de fin des règles est obligatoire');
      return ValidationResult(isValid: false, errors: errors);
    }

    if (startDate.isAfter(DateTime.now())){
      errors.add('La date de début ne peut pas être dans le futur');
    }

    if (endDate.isBefore(startDate)){
      errors.add('La date de fin doit être après la date de début');
    }
    if (endDate.isAfter(DateTime.now())){
      errors.add('La date de fin ne peut pas être dans le futur');
    }
    final duration = endDate.difference(startDate).inDays;

    if (duration > 15){
      errors.add(
        'Vos règles ont duré $duration jours.'
        'Si c\'est inhabituel pour vous, vérifiez les dates.'
      );
    }

    if (duration < 1){
      errors.add('La durée des règles doit être d\'au moins 1 jour');
    }

    return ValidationResult(isValid: errors.isEmpty, errors: errors);
  }

  static ValidationResult validateDateRecency(DateTime date){
    final sixMonthsAgo = DateTime.now().subtract(const Duration(days: 180));

    if (date.isBefore(sixMonthsAgo)){
      return ValidationResult(isValid: false, 
      errors: [
        'Cette date est très ancienne (plus de 6 mois).'
        'Pour de meilleures prédictions, utilisez vos dernières règles.'
      ],
    );
    }
    return ValidationResult(isValid: true, errors: []);
  }
}

class ValidationResult {
  final bool isValid;
  final List <String> errors;
  final List <String> warnings;

  ValidationResult({
    required this.isValid,
    this.errors = const [],
    this.warnings = const [],
  });

  String? get firstError => errors.isNotEmpty ? errors.first : null;
  String? get firstWarning => warnings.isNotEmpty ? warnings.first : null;
  String get message => [...errors, ...warnings].join('\n');

  bool get hasErrors => errors.isNotEmpty;
  bool get hasWarnings => warnings.isNotEmpty;
}