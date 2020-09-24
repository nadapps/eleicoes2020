import 'package:eleicoes2020/constants/states.dart';
import 'package:eleicoes2020/screens/HomeScreen.dart';
import 'package:eleicoes2020/screens/NewsScreen.dart';
import 'package:eleicoes2020/screens/StatesScreen.dart';
import 'package:flutter/material.dart';
import 'package:eleicoes2020/extension/string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String cityName = '';
  String stateName = '';

  @override
  void initState() {
    super.initState();
    readData();
  }

  readData() async {
    final prefs = await SharedPreferences.getInstance();
    String stateCode = prefs.getString("eleicoes2022@state");
    Map<String, String> state =
        states.firstWhere((state) => state['abrev'] == stateCode);

    this.setState(() {
      cityName = prefs.getString("eleicoes2022@cityName");
      stateName = state['name'];
    });
  }

  exit() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("eleicoes2022@cityCode");
    prefs.remove("eleicoes2022@cityName");
    prefs.remove("eleicoes2022@state");
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
              height: 160.0,
              child: DrawerHeader(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/user-image.jpg"),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              'Novo usuário',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Text(
                            'Estado: $stateName',
                            style: TextStyle(color: Colors.white),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text(
                            'Cidade: ${cityName.capitalize()}',
                            style: TextStyle(color: Colors.white),
                          )),
                    ]),
                decoration: BoxDecoration(
                  color: const Color(0xff009F4F),
                ),
              )),
          ListTile(
            title: Text('Home'),
            leading: Icon(
              Icons.home,
              color: Colors.grey,
              size: 25.0,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Prefeito'),
            leading: Icon(
              Icons.person,
              color: Colors.grey,
              size: 25.0,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StatesScreen(
                    codeOffice: '11',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Vereador'),
            leading: Icon(
              Icons.people,
              color: Colors.grey,
              size: 25.0,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StatesScreen(
                    codeOffice: '13',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Notícias'),
            leading: Icon(
              Icons.rss_feed,
              color: Colors.grey,
              size: 25.0,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Sair'),
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.grey,
              size: 25.0,
            ),
            onTap: exit,
          ),
        ],
      ),
    );
  }
}
