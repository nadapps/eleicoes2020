class City {
  final String code;
  final String name;

  City({this.code, this.name});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      code: json['codigo'],
      name: json['nome'],
    );
  }
}
