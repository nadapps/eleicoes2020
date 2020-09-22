class Candidate {
  final int id;
  final String name;
  final String nickname;
  final String coalition;
  final String politicalParty;

  Candidate(
      {this.id, this.nickname, this.name, this.coalition, this.politicalParty});

  factory Candidate.fromJson(Map<String, dynamic> json) {
    return Candidate(
      id: json['id'],
      nickname: json['nomeUrna'],
      name: json.containsKey('nome') ? json['nome'] : json['nomeCompleto'],
      coalition: json['nomeColigacao'],
      politicalParty: json['partido']['sigla'],
    );
  }
}
