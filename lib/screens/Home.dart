import 'package:eleicoes2020/screens/Candidatos.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eleições 2020'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Open route'),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Candidatos()));
          },
        ),
      ),
    );
  }
}
