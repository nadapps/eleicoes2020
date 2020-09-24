import 'package:eleicoes2020/models/Party.dart';

class Candidate {
  final int id;
  final String name;
  final String nickname;
  final String coalition;
  final Party party;
  final String photo;

  Candidate(
      {this.id,
      this.nickname,
      this.name,
      this.coalition,
      this.party,
      this.photo});

  factory Candidate.fromJson(Map<String, dynamic> json) {
    Party party;

    if (json.containsKey('partido')) {
      party = Party.fromJson(json['partido']);
    }

    return Candidate(
        id: json['id'],
        nickname: json['nomeUrna'],
        name: json.containsKey('nome') ? json['nome'] : json['nomeCompleto'],
        coalition: json['nomeColigacao'],
        photo: json['fotoUrl'],
        party: party);
  }

  bool toEqualSearch(String term) {
    bool equal = false;
    if (this.name != null) {
      equal = this.name.toLowerCase().contains(term.toLowerCase());
    }

    if (this.nickname != null) {
      equal = this.nickname.toLowerCase().contains(term.toLowerCase());
    }

    return equal;
  }
}
