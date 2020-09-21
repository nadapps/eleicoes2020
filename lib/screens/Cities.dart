import 'package:eleicoes2020/components/Card.dart' as card;
import 'package:eleicoes2020/components/Header.dart';
import 'package:eleicoes2020/components/Root.dart';
import 'package:flutter/material.dart';

class Cities extends StatelessWidget {
  Cities({String state}) {
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(title: "Cidades"),
        body: Root(context,
            child: card.Card(
              child: Text('Cidades'),
            )));
  }
}
