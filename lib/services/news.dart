import 'dart:convert';

import 'package:eleicoes2020/constants/base.dart';
import 'package:eleicoes2020/models/News.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future<List<News>> allNews() async {
  final response = await http.get(
      '$BASE_URL_NEWS?q=eleições 2020 brasil&count=20&offset=0&mkt=pt-BR&safeSearch=Moderate&',
      headers: {"Ocp-Apim-Subscription-Key": DotEnv().env['MICROSOFT_TOKEN']});

  if (response.statusCode == 200) {
    Map<String, dynamic> map = json.decode(response.body);
    List<News> news = List.from(map["value"])
        .where((dynamic model) => model['image'] != null)
        .map((dynamic model) => News.fromJson(model))
        .toList();

    return news;
  } else {
    throw Exception('Failed to load news');
  }
}
