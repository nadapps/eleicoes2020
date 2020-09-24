import 'package:eleicoes2020/components/Card.dart' as card;
import 'package:eleicoes2020/components/CardHome.dart';
import 'package:eleicoes2020/components/Header.dart';
import 'package:eleicoes2020/components/Menu.dart';
import 'package:eleicoes2020/components/Root.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Menu(),
        appBar: Header(title: "Eleições 2020"),
        body: Root(context,
            child: Column(
              children: <Widget>[
                CardHome(title: "Suas opções de prefeito", codeOffice: "11"),
                CardHome(title: "Suas opções de vereador", codeOffice: "13"),
              ],
            )));
  }
}
