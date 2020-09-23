import 'package:eleicoes2020/components/Header.dart';
import 'package:eleicoes2020/components/Menu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: Header(title: "Eleições 2020"),
      body: Center(
        child: RaisedButton(
          child: Text('Open route'),
          onPressed: () {
            //
          },
        ),
      ),
    );
  }
}
