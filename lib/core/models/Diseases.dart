
class Diseases {
  String id;
  int idListDisease ;

  Diseases({
    required this.id,
    required this.idListDisease,
  });

  Map<String, dynamic> toMap() => {
    'id' : id,
    'idListDisease' : idListDisease
  };

  static getAllMyDiseases(List<Diseases> diseases, String idDisease){
    return diseases.firstWhere(
      (diseases) => diseases.id == idDisease,
      orElse: () => throw Exception('Ooops, quelque chose s\'est passé, maladies n\'a pas pu charger'),
    );
  }

}