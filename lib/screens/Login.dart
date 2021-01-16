import 'package:eleicoes2020/components/DropdownBorder.dart';
import 'package:eleicoes2020/models/City.dart';
import 'package:eleicoes2020/screens/HomeScreen.dart';
import 'package:eleicoes2020/services/city.dart';
import 'package:flutter/material.dart';
import 'package:eleicoes2020/extension/string.dart';
import 'package:eleicoes2020/constants/states.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<List<City>> futureCities;
  String dropdownValue = "";
  String dropdownCityValue = "";

  var statesSelect = [
    {"abrev": "", "name": "Escolha um estado"}
  ]..addAll(states);

  login() async {
    final prefs = await SharedPreferences.getInstance();
    if (dropdownValue != "" && dropdownCityValue != "") {
      List<City> cities = await getCities(dropdownValue);
      City city = cities.firstWhere((city) => city.code == dropdownCityValue);

      prefs.setString("eleicoes2022@cityName", city.name);
      prefs.setString("eleicoes2022@cityCode", city.code);
      prefs.setString("eleicoes2022@state", dropdownValue);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg-login.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
              child: SingleChildScrollView(
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
              DropdownBorder(
                margin: EdgeInsets.only(top: 40),
                value: dropdownValue,
                selectedItemBuilder: (BuildContext context) {
                  return statesSelect.map((Map<String, String> value) {
                    return Row(children: <Widget>[
                      Text(
                        value['name'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      )
                    ]);
                  }).toList();
                },
                onChanged: (String newValue) {
                  futureCities = getCities(newValue);
                  setState(() {
                    dropdownValue = newValue;
                    dropdownCityValue = "";
                  });
                },
                items: statesSelect
                    .map<DropdownMenuItem<String>>((Map<String, String> value) {
                  return DropdownMenuItem<String>(
                    value: value['abrev'],
                    child: Text(
                      value['name'],
                    ),
                  );
                }).toList(),
              ),
              FutureBuilder(
                  future: futureCities,
                  builder: (context, snapshot) {
                    City cityEmpty = City(code: "", name: "Escolha uma cidade");
                    List<City> cities = snapshot.hasData
                        ? [cityEmpty, ...snapshot.data]
                        : [cityEmpty];

                    return DropdownBorder(
                        margin: EdgeInsets.only(top: 20),
                        value: dropdownCityValue,
                        selectedItemBuilder: (BuildContext context) {
                          return cities.map((City city) {
                            return Row(children: <Widget>[
                              Text(
                                city.code == ""
                                    ? city.name
                                    : city.name.capitalize(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              )
                            ]);
                          }).toList();
                        },
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownCityValue = newValue;
                          });
                        },
                        items:
                            cities.map<DropdownMenuItem<String>>((City city) {
                          return DropdownMenuItem<String>(
                            value: city.code,
                            child: Text(
                              city.name.capitalize(),
                            ),
                          );
                        }).toList());
                  }),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    child: Text('Acessar'),
                    color: const Color(0xffFEB300),
                    onPressed: login,
                  )),
            ],
          )))),
    );
  }
}
