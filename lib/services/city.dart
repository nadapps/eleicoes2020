import 'dart:convert';

import 'package:eleicoes2020/constants/base.dart';
import 'package:eleicoes2020/models/City.dart';
import 'package:http/http.dart' as http;

Future<List<City>> getCities(String state) async {
  final response = await http
      .get('$BASE_URL/eleicao/buscar/$state/$ELECTIONS_CODE/municipios');

  if (response.statusCode == 200) {
    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> listCities = map["municipios"];

    List<City> cities =
        listCities.map((dynamic model) => City.fromJson(model)).toList();

    return cities;
  } else {
    throw Exception('Failed to load cities');
  }
}

Future<List<City>> getCitiesQuarkus(String state) async {
  final response =
      await http.get('$BASE_URL_QUARKUS/locais/municipios?estado=$state');

  if (response.statusCode == 200) {
    List<dynamic> listCities = json.decode(utf8.decode(response.bodyBytes));

    List<City> cities =
        listCities.map((dynamic model) => City.fromJsonQuarkus(model)).toList();

    return cities;
  } else {
    throw Exception('Failed to load cities');
  }
}
