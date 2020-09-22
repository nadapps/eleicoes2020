import 'package:eleicoes2020/screens/HomeScreen.dart';
import 'package:eleicoes2020/screens/Login.dart';
import 'package:eleicoes2020/screens/StatesScreen.dart';
import 'package:flutter/material.dart';

class Menu extends Drawer {
  Menu(BuildContext context)
      : super(
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
                                'Estado: Pernambuco',
                                style: TextStyle(color: Colors.white),
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                'Cidade: Recife',
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
                title: Text('Sair'),
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.grey,
                  size: 25.0,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                  );
                },
              ),
            ],
          ),
        );
}
