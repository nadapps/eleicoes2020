class Election {
  final int year;
  final String office;
  final String party;
  final String situation;
  final String location;

  Election({this.year, this.office, this.party, this.situation, this.location});

  factory Election.fromJson(Map<String, dynamic> json) {
    return Election(
        year: json['nrAno'],
        office: json['cargo'],
        party: json['partido'],
        situation: json['situacaoTotalizacao'],
        location: json['local']);
  }
}
