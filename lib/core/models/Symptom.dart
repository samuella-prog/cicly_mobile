class Symptom {
  final int id;
  final String name;
  final int intensity; // e.g., scale from 1 to 10
  final DateTime date;

  Symptom({
    required this.id,
    required this.name,
    required this.intensity,
    required this.date,
  });

  factory Symptom.fromJson(Map<String, dynamic> json) {
    return Symptom(
      id: json['id'],
      name: json['name'],
      intensity: json['intensity'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'intensity': intensity,
      'date': date.toIso8601String(),
    };
  }
}
