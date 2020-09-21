import 'package:eleicoes2020/components/Card.dart' as card;
import 'package:eleicoes2020/components/Header.dart';
import 'package:eleicoes2020/components/Root.dart';
import 'package:eleicoes2020/constants/states.dart';
import 'package:flutter/material.dart';

class States extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(title: "Estados"),
        body: Root(
            child: card.Card(
          child: Center(
            child: ListView(
              children: states.map<Widget>((Map<String, String> state) {
                var index = states.indexOf(state);

                return Column(children: <Widget>[
                  ListTile(
                    leading: Image.network(
                      state['flag'],
                      width: 40,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 18.0,
                    ),
                    title: Text(state['state']),
                  ),
                  if (index < states.length - 1)
                    Divider(
                      height: 0,
                      thickness: 1,
                      indent: 73.0,
                    )
                ]);
              }).toList(),
            ),
          ),
        )));
  }
}
