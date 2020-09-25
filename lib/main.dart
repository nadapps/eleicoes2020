import 'package:eleicoes2020/screens/HomeScreen.dart';
import 'package:eleicoes2020/screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

//CircularProgressIndicator
class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<SharedPreferences> futureSharedPreferences;
  String stateName = '';

  @override
  void initState() {
    super.initState();
    futureSharedPreferences = SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eleições 2020',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: FutureBuilder(
          future: futureSharedPreferences,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              SharedPreferences prefs = snapshot.data;

              if (prefs.containsKey('eleicoes2022@cityCode') &&
                  prefs.containsKey('eleicoes2022@cityName') &&
                  prefs.containsKey('eleicoes2022@state')) {
                return HomeScreen();
              }

              return Login();
            }

            return CircularProgressIndicator();
          }),
    );
  }
}
