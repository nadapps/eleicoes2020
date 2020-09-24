import 'package:eleicoes2020/components/Card.dart' as card;
import 'package:eleicoes2020/screens/CandidatesScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardHome extends StatelessWidget {
  final String title;
  final String codeOffice;

  CardHome({@required this.title, @required this.codeOffice});

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
        Row(
            children: [0, 1, 2].map<Widget>((int item) {
          return Expanded(
              flex: 1,
              child: GestureDetector(
                  onTap: () async {
                    final prefs = await SharedPreferences.getInstance();
                    String stateCode = prefs.getString("eleicoes2022@state");
                    String cityCode = prefs.getString("eleicoes2022@cityCode");

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CandidatesScreen(
                            state: stateCode,
                            city: cityCode,
                            codeOffice: this.codeOffice),
                      ),
                    );
                  },
                  child: Container(
                      height: 150,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      color: Colors.grey[300],
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
        }).toList())
      ]),
    );
  }
}
