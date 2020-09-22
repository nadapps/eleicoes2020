import 'package:eleicoes2020/screens/HomeScreen.dart';
import 'package:flutter/material.dart';

import 'package:eleicoes2020/constants/states.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String dropdownValue = "";
  var statesSelect = [
    {"abrev": "", "state": "Escolha um estado"}
  ]..addAll(states);

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
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 120, horizontal: 30),
          child: Column(
            children: <Widget>[
              Image(
                  image: AssetImage('assets/logo.png'),
                  fit: BoxFit.cover,
                  width: 200,
                  height: 200),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                      'Queremos saber apenas seu estado para facilitar a navegação',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold))),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 40),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      )),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    selectedItemBuilder: (BuildContext context) {
                      return statesSelect.map((Map<String, String> value) {
                        return Row(children: <Widget>[
                          Text(
                            value['state'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          )
                        ]);
                      }).toList();
                    },
                    isExpanded: true,
                    // value: dropdownValue,
                    elevation: 16,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    underline: Container(
                      height: 0,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: statesSelect.map<DropdownMenuItem<String>>(
                        (Map<String, String> value) {
                      return DropdownMenuItem<String>(
                        value: value['abrev'],
                        child: Text(
                          value['state'],
                        ),
                      );
                    }).toList(),
                  )),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    child: Text('Acessar'),
                    color: const Color(0xffFEB300),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                  )),
            ],
          )),
    ));
  }
}
