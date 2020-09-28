import 'package:eleicoes2020/enuns/Office.dart';
import 'package:eleicoes2020/enuns/Sex.dart';
import 'package:eleicoes2020/models/Party.dart';
import 'package:eleicoes2020/models/Goods.dart';

import 'Election.dart';

class Candidate {
  final int id;
  final String name;
  final String nickname;
  final String coalition;
  final Party party;
  final String photo;
  final Sex sex;
  final List<Goods> goods;
  final String officeName;
  final Office officeType;
  final int number;
  final String cityName;
  final List<Election> elections;
  final List<String> socials;
  final String breed;
  final String naturalness;
  final Candidate vice;
  final double goodsTotal;

  Candidate(
      {this.id,
      this.nickname,
      this.name,
      this.coalition,
      this.party,
      this.photo,
      this.sex,
      this.goods,
      this.officeName,
      this.number,
      this.cityName,
      this.officeType,
      this.elections,
      this.socials,
      this.breed,
      this.naturalness,
      this.vice,
      this.goodsTotal});

  factory Candidate.fromJson(Map<String, dynamic> json) {
    Party party;

    List<Election> elections = [];
    if (json.containsKey('eleicoesAnteriores') &&
        json['eleicoesAnteriores'] != null) {
      elections = List.from(json['eleicoesAnteriores'])
          .map<Election>((dynamic election) {
        return Election.fromJson(election);
      }).toList();
    }

    if (json.containsKey('partido')) {
      party = Party.fromJson(json['partido']);
    }

    List<Goods> goods = [];
    if (json.containsKey('bens') && json['bens'] != null) {
      goods = List.from(json['bens']).map<Goods>((dynamic goods) {
        return Goods.fromJson(goods);
      }).toList();
    }

    Candidate vice;
    if (json.containsKey('vices') && json['vices'] != null) {
      List<dynamic> vices = json['vices'];

      if (vices.length > 0) {
        vice = Candidate.fromJson(vices[0]);
      }
    }

    return Candidate(
        id: json['id'],
        breed: json['descricaoCorRaca'],
        naturalness: json['descricaoNaturalidade'],
        nickname:
            json.containsKey('nm_URNA') ? json['nm_URNA'] : json['nomeUrna'],
        name: json.containsKey('nome') ? json['nome'] : json['nomeCompleto'],
        coalition: json['nomeColigacao'],
        photo: json.containsKey('urlFoto') ? json['urlFoto'] : json['fotoUrl'],
        vice: vice,
        party: party,
        goods: goods,
        sex: json['descricaoSexo'] == 'MASC.' ? Sex.MALE : Sex.FEMALE,
        officeName: json.containsKey('cargo')
            ? json['cargo']['nome']
            : json['ds_CARGO'],
        officeType: json.containsKey('cargo')
            ? json['cargo']['codigo'] == 11
                ? Office.MAYOR
                : Office.ALDERMAN
            : Office.VICE_MAYOR,
        number: json['numero'],
        cityName: json['localCandidatura'],
        elections: elections,
        goodsTotal:
            json['totalDeBens'] == null ? 0.0 : json['totalDeBens'].toDouble(),
        socials: json.containsKey('sites') && json['sites'] != null
            ? List<String>.from(json['sites'])
            : List.empty());
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
