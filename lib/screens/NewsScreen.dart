import 'package:eleicoes2020/components/Card.dart' as card;
import 'package:eleicoes2020/components/EmptyState.dart';
import 'package:eleicoes2020/components/Header.dart';
import 'package:eleicoes2020/components/Root.dart';
import 'package:eleicoes2020/models/News.dart';
import 'package:eleicoes2020/services/news.dart';
import 'package:flutter/material.dart';
import 'package:eleicoes2020/extension/iterable.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({
    Key key,
  }) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  Future<List<News>> futureNews;

  @override
  void initState() {
    super.initState();
    futureNews = allNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(title: "Notícias"),
        body: FutureBuilder(
            future: futureNews,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<News> list = snapshot.data;

                if (list.length == 0) {
                  return Root(context,
                      child: card.Card(
                          child: (EmptyState(
                              title: 'Oh! A lista está vazia',
                              description:
                                  'A lista de notícias se encontra vazia, tente novamente mais tarde.',
                              icon: Icons.format_list_bulleted))));
                }

                return buildListNews(list, context);
              } else if (snapshot.hasError) {
                return Root(context,
                    child: card.Card(
                        child: (EmptyState(
                            title: "Oops...",
                            description:
                                'Ocorreu um erro ao buscar os dados, tente novamente mais tarde.',
                            icon: Icons.portable_wifi_off))));
              }

              return Center(child: CircularProgressIndicator());
            }));
  }

  Widget buildListNews(List<News> list, BuildContext context) {
    DateFormat dateFormat = DateFormat("dd/MM/yyyy HH:mm");

    return Root(
      context,
      child: ListView(
          children: list.mapIndex<Widget>((News news, int index) {
        return card.Card(
            margin: EdgeInsets.only(bottom: 16),
            child: Column(
              children: <Widget>[
                Image.network(
                  "${news.imageUrl}&h=${news.imageHeight}",
                  fit: BoxFit.cover,
                  width: news.imageWidth + 0.0,
                  height: 120,
                ),
                Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "${dateFormat.format(news.datePublished)} - ${news.company}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 13,
                                fontWeight: FontWeight.w900),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                news.name,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  color: Colors.grey[800],
                                ),
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                news.description,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey[800],
                                ),
                              )),
                          Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(top: 10),
                              child: RaisedButton(
                                child:
                                    Text('Clique aqui para acessar a notícia'),
                                color: const Color(0xffFEB300),
                                onPressed: () async {
                                  if (await canLaunch(news.url)) {
                                    await launch(news.url);
                                  }
                                },
                              ))
                        ])),
              ],
            ));
      }).toList()),
    );
  }
}
