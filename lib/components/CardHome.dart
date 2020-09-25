import 'package:eleicoes2020/components/Card.dart' as card;
import 'package:eleicoes2020/screens/CandidateScreen.dart';
import 'package:eleicoes2020/screens/CandidatesScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Digits.dart';

class CardHome extends StatelessWidget {
  final String title;
  final String codeOffice;
  final List<Map<String, dynamic>> items;

  CardHome(
      {@required this.title, @required this.codeOffice, @required this.items});

  void handleCandidates(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    String stateCode = prefs.getString("eleicoes2022@state");
    String cityCode = prefs.getString("eleicoes2022@cityCode");

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CandidatesScreen(
            state: stateCode, city: cityCode, codeOffice: this.codeOffice),
      ),
    );
  }

  void handleCandidate(
      Map<String, dynamic> candidate, BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    String stateCode = prefs.getString("eleicoes2022@state");
    String cityCode = prefs.getString("eleicoes2022@cityCode");

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CandidateScreen(
          state: stateCode,
          city: cityCode,
          officeCode: this.codeOffice,
          candidateCode: candidate['id'],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return card.Card(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      margin: EdgeInsets.only(bottom: 16),
      child: Column(children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 16),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )),
        Row(children: <Widget>[
          ...this.items.map<Widget>((Map<String, dynamic> item) {
            return Expanded(
                flex: 1,
                child: GestureDetector(
                    onTap: () => handleCandidate(item, context),
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.grey[600],
                          width: 1,
                        )),
                        child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: Image.network(
                                    "${item['photo']}",
                                    fit: BoxFit.cover,
                                    height: 150,
                                  )),
                              Positioned(
                                  bottom: 30,
                                  child: Digits(
                                    number: item['number'],
                                    small: true,
                                  )),
                              Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(vertical: 4),
                                  color: Colors.grey[600],
                                  child: Text(
                                    item['name'],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 10),
                                  ))
                            ]))));
          }),
          ...List(3 - this.items.length).map<Widget>((dynamic item) {
            return Expanded(
                flex: 1,
                child: GestureDetector(
                    onTap: () => handleCandidates(context),
                    child: Container(
                        height: 172,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            border: Border.all(
                              color: Colors.grey[600],
                              width: 1,
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.person_add,
                              color: Colors.grey[600],
                              size: 40,
                            ),
                            Text(
                              "selecione",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey[600]),
                            )
                          ],
                        ))));
          }).toList()
        ])
      ]),
    );
  }
}
