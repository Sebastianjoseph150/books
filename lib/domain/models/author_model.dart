class AuthorModel {
  final String name;
  final String id;
  final String birthDate;
  final String biography;

  AuthorModel(
      {required this.id,
      required this.name,
      required this.biography,
      required this.birthDate});

  factory AuthorModel.fromjson(Map<String, dynamic> json) {
    return AuthorModel(
        id: json['id'],
        name: json['name'],
        biography: json['biography'],
        birthDate: json['birthdate']);
  }
}
