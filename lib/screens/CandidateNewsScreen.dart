import 'package:eleicoes2020/components/EmptyState.dart';
import 'package:eleicoes2020/models/Candidate.dart';
import 'package:eleicoes2020/models/News.dart';
import 'package:eleicoes2020/services/news.dart';
import 'package:flutter/material.dart';
import 'package:eleicoes2020/extension/iterable.dart';
import 'package:url_launcher/url_launcher.dart';

class CandidateNewsScreen extends StatefulWidget {
  final Candidate candidate;

  CandidateNewsScreen({Key key, this.candidate}) : super(key: key);

  @override
  _CandidateNewsScreenState createState() => _CandidateNewsScreenState();
}

class _CandidateNewsScreenState extends State<CandidateNewsScreen> {
  Future<List<News>> futureNews;

  @override
  void initState() {
    super.initState();
    futureNews = searchNews("${widget.candidate.cityName} eleição 2020");
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Padding(
          padding: EdgeInsets.only(bottom: 10, top: 10),
          child: Text('Notícias de ${widget.candidate.cityName}',
              style: TextStyle(fontWeight: FontWeight.w800))),
      Expanded(
          child: FutureBuilder(
              future: futureNews,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<News> list = snapshot.data;

                  if (list.length == 0) {
                    return EmptyState(
                        description:
                            'No momento a cidade deste candidato não possui notícias sobre a eleição.',
                        icon: Icons.format_list_bulleted);
                  }

                  return buildListNews(list, context);
                } else if (snapshot.hasError) {
                  return EmptyState(
                      title: "Oops...",
                      description:
                          'Ocorreu um erro ao buscar os dados, tente novamente mais tarde.',
                      icon: Icons.portable_wifi_off);
                }

                return Center(child: CircularProgressIndicator());
              }))
    ]);
  }

  Widget buildListNews(List<News> list, BuildContext context) {
    return ListView(
        children: list.mapIndex<Widget>((News news, int index) {
      return Column(children: <Widget>[
        Material(
            color: Colors.transparent,
            child: (InkWell(
                child: ListTile(
                    leading: ClipRRect(
                      child: Image.network(
                        "${news.imageUrl}&h=${news.imageHeight}",
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    onTap: () async {
                      if (await canLaunch(news.url)) {
                        await launch(news.url);
                      }
                    },
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 18.0,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    title: Text(
                      news.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(news.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12)),
                    ))))),
        if (index < list.length - 1)
          Divider(
            height: 0,
            thickness: 1,
          )
      ]);
    }).toList());
  }
}
