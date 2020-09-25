import 'package:eleicoes2020/enuns/Office.dart';
import 'package:eleicoes2020/enuns/Sex.dart';
import 'package:eleicoes2020/models/Party.dart';

class Candidate {
  final int id;
  final String name;
  final String nickname;
  final String coalition;
  final Party party;
  final String photo;
  final Sex sex;
  final String officeName;
  final Office officeType;
  final int number;
  final String cityName;

  Candidate(
      {this.id,
      this.nickname,
      this.name,
      this.coalition,
      this.party,
      this.photo,
      this.sex,
      this.officeName,
      this.number,
      this.cityName,
      this.officeType});

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
        party: party,
        sex: json['descricaoSexo'] == 'MASC.' ? Sex.MALE : Sex.FEMALE,
        officeName: json['cargo']['nome'],
        officeType:
            json['cargo']['codigo'] == 11 ? Office.MAYOR : Office.ALDERMAN,
        number: json['numero'],
        cityName: json['localCandidatura']);
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
