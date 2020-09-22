import 'dart:convert';

import 'package:eleicoes2020/constants/base.dart';
import 'package:eleicoes2020/models/Candidate.dart';
import 'package:http/http.dart' as http;

Future<List<Candidate>> getCandidates(String city, String codeOffice) async {
  final response = await http.get(
      '$BASE_URL/candidatura/listar/$YEAR/$city/$ELECTIONS_CODE/$codeOffice/candidatos');

  if (response.statusCode == 200) {
    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> listCandidates = map["candidatos"];

    List<Candidate> candidates = listCandidates
        .map((dynamic model) => Candidate.fromJson(model))
        .toList();

    return candidates;
  } else {
    throw Exception('Failed to load candidates');
  }
}
