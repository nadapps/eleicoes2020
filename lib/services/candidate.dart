import 'dart:convert';

import 'package:eleicoes2020/constants/base.dart';
import 'package:eleicoes2020/models/Candidate.dart';
import 'package:eleicoes2020/models/Finance.dart';
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

Future<List<Candidate>> getCandidatesQuarkus(
    String state, String city, String office) async {
  final response = await http.get(
      '$BASE_URL_QUARKUS/candidatos/$office/lista?estado=$state&municipio=$city');

  if (response.statusCode == 200) {
    Map<String, dynamic> map = json.decode(utf8.decode(response.bodyBytes));
    List<dynamic> listCandidates = map["candidatos"];

    List<Candidate> candidates = listCandidates
        .map((dynamic model) => Candidate.fromJson(model))
        .toList();

    return candidates;
  } else {
    throw Exception('Failed to load candidates');
  }
}

Future<Candidate> getCandidate(String city, int candidateCode) async {
  final response = await http.get(
      '$BASE_URL/candidatura/buscar/$YEAR/$city/$ELECTIONS_CODE/candidato/$candidateCode');

  if (response.statusCode == 200) {
    Map<String, dynamic> map = json.decode(response.body);
    Candidate candidate = Candidate.fromJson(map);

    return candidate;
  } else {
    throw Exception('Failed to load candidate');
  }
}

Future<Candidate> getCandidateQuarkus(
    String city, String state, String office, int candidateCode) async {
  final response = await http.get(
      '$BASE_URL_QUARKUS/candidatos/$office/detalhe?estado=$state&municipio=$city&candidato=$candidateCode');

  if (response.statusCode == 200) {
    Map<String, dynamic> map = json.decode(utf8.decode(response.bodyBytes));
    Candidate candidate = Candidate.fromJson(map);

    return candidate;
  } else {
    throw Exception('Failed to load candidate');
  }
}

Future<Finance> getFinances(
    {String city,
    String officeCode,
    int candidateCode,
    int partyNumber,
    int number}) async {
  final response = await http.get(
      '$BASE_URL/prestador/consulta/$ELECTIONS_CODE/$YEAR/$city/$officeCode/$partyNumber/$number/$candidateCode');

  if (response.statusCode == 200) {
    Map<String, dynamic> map = json.decode(response.body);
    Finance finance = Finance.fromJson(map);

    return finance;
  } else {
    throw Exception('Failed to load finance');
  }
}
