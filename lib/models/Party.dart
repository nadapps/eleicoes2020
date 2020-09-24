import 'package:eleicoes2020/constants/parties.dart';
import 'package:flutter/material.dart';

class Party {
  final int number;
  final String name;
  final String initials;
  final Color color;
  final String image;

  Party({this.number, this.initials, this.name, this.image, this.color});

  factory Party.fromJson(Map<String, dynamic> json) {
    Map<String, Object> partyDetails = parties.firstWhere(
        (item) => item['initials'] == "${json['sigla']}".replaceAll(' ', ''));

    return Party(
        number: json['numero'],
        initials: partyDetails['initials'],
        name: json['nome'],
        color: Color(partyDetails['color']),
        image: partyDetails['image']);
  }
}
