
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

  factory Diseases.fromJson(Map<String,dynamic> map){
    return Diseases(id: map['id'], idListDisease: map ['idListDiseases']) ;
  }

  @override
  bool operator ==(Object other) => 
    identical(this, other) || 
    other is Diseases && runtimeType == other.runtimeType && id == other.id;
    
    @override 
    int get hashCode => id.hashCode;

  static getAllMyDiseases(List<Diseases> diseases, String idDisease){
    return diseases.firstWhere(
      (diseases) => diseases.id == idDisease,
      orElse: () => throw Exception('Ooops, quelque chose s\'est passé, maladies n\'a pas pu charger'),
    );
  }

}