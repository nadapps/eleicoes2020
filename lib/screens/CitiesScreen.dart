import 'package:eleicoes2020/components/Card.dart' as card;
import 'package:eleicoes2020/components/EmptyState.dart';
import 'package:eleicoes2020/components/Header.dart';
import 'package:eleicoes2020/components/Root.dart';
import 'package:eleicoes2020/constants/states.dart';
import 'package:eleicoes2020/models/City.dart';
import 'package:eleicoes2020/screens/CandidatesScreen.dart';
import 'package:eleicoes2020/services/city.dart';
import 'package:flutter/material.dart';
import 'package:eleicoes2020/extension/string.dart';
import 'package:eleicoes2020/extension/iterable.dart';

class CitiesScreen extends StatefulWidget {
  final String state;
  final String codeOffice;

  CitiesScreen({Key key, @required this.state, @required this.codeOffice})
      : super(key: key);

  @override
  _CitiesScreenState createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen> {
  String search = '';
  String stateName;
  Future<List<City>> futureCities;

  @override
  void initState() {
    super.initState();
    futureCities = getCities(widget.state);

    Map<String, String> state =
        states.firstWhere((state) => state['abrev'] == widget.state);
    this.setState(() {
      stateName = state['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(title: "Cidades - $stateName"),
        body: Root(context,
            child: Column(children: <Widget>[
              card.Card(
                  margin: EdgeInsets.only(bottom: 16),
                  padding: EdgeInsets.fromLTRB(4, 4, 16, 4),
                  child: TextField(
                    onChanged: (String text) {
                      setState(() {
                        search = text;
                      });
                    },
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey[500],
                        ),
                        border: InputBorder.none,
                        hintText: 'Buscar cidade...'),
                  )),
              Expanded(
                  child: card.Card(
                child: FutureBuilder(
                    future: futureCities,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<City> list = new List<City>.from(snapshot.data)
                            .where((City city) => city.name
                                .toLowerCase()
                                .contains(search.toLowerCase()))
                            .toList();

                        if (list.length == 0) {
                          return EmptyState(
                              title: 'Oh! A lista está vazia',
                              description:
                                  'Faça uma busca diferente ou acesse outra lista de cidades.',
                              icon: Icons.format_list_bulleted);
                        }

                        return buildListCities(list, context);
                      } else if (snapshot.hasError) {
                        return EmptyState(
                            title: "Oops...",
                            description:
                                'Ocorreu um erro ao buscar os dados, tente novamente mais tarde.',
                            icon: Icons.portable_wifi_off);
                      }

                      return Center(child: CircularProgressIndicator());
                    }),
              ))
            ])));
  }

  Widget buildListCities(List<City> list, BuildContext context) {
    return ListView(
      children: list.mapIndex<Widget>((City city, int index) {
        return Column(children: <Widget>[
          Material(
              color: Colors.transparent,
              child: (InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CandidatesScreen(
                            state: widget.state,
                            city: city.code,
                            codeOffice: widget.codeOffice),
                      ),
                    );
                  },
                  child: ListTile(
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 18.0,
                    ),
                    title: Text(city.name.capitalize()),
                  )))),
          if (index < list.length - 1)
            Divider(
              height: 0,
              thickness: 1,
            )
        ]);
      }).toList(),
    );
  }
}
