class OnboardingData {
  DateTime? periodStartDate;
  DateTime? periodEndDate;
  List<int> selectedDiseaseIds;

  OnboardingData({
    this.periodStartDate,
    this.periodEndDate,
    this.selectedDiseaseIds = const [],
  });

  bool get hasPeriodDates => periodStartDate != null && periodEndDate != null;

  int get periodDuration {
    if (!hasPeriodDates) return 0;
    return periodEndDate!.difference(periodStartDate!).inDays;
  }

  bool get canProceed => hasPeriodDates;

  bool get isComplete => hasPeriodDates;
  bool get issComplete => hasPeriodDates ;

  void reset(){
    periodStartDate = null ;
    periodEndDate = null ;
    selectedDiseaseIds = [];
  }

  Map<String, dynamic> toJson() => {
    'periodStartDate': periodStartDate?.toIso8601String(),
    'periodEndDate': periodEndDate?.toIso8601String(),
    'selectedDiseaseIds': selectedDiseaseIds,
  };

  factory OnboardingData.fromJson(Map<String, dynamic> json) {
    return OnboardingData(
      periodStartDate: json['periodStartDate'] != null 
          ? DateTime.parse(json['periodStartDate']) 
          : null,
      periodEndDate: json['periodEndDate'] != null 
          ? DateTime.parse(json['periodEndDate']) 
          : null,
      selectedDiseaseIds: List<int>.from(json['selectedDiseaseIds'] ?? []),
    );
  }

  OnboardingData copyWith({
    DateTime? periodStartDate,
    DateTime? periodEndDate,
    List<int>? selectedDiseaseIds,
  }) {
    return OnboardingData(
      periodStartDate: periodStartDate ?? this.periodStartDate,
      periodEndDate: periodEndDate ?? this.periodEndDate,
      selectedDiseaseIds: selectedDiseaseIds ?? this.selectedDiseaseIds,
    );
  }
}