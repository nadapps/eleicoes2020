class Candidate {
  final String name;
  final String nickname;
  final String coalition;
  final String politicalParty;

  Candidate({this.nickname, this.name, this.coalition, this.politicalParty});

  factory Candidate.fromJson(Map<String, dynamic> json) {
    return Candidate(
      nickname: json['nomeUrna'],
      name: json['nome'],
      coalition: json['nomeColigacao'],
      politicalParty: json['partido']['sigla'],
    );
  }
}
