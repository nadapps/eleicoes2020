import 'package:eleicoes2020/screens/Home.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/bg-login.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: <Widget>[
          RaisedButton(
            child: Text('Open route'),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          )
        ],
      ),
    ));
  }
}
