import 'package:eleicoes2020/components/Card.dart' as card;
import 'package:eleicoes2020/components/Header.dart';
import 'package:eleicoes2020/components/Root.dart';
import 'package:eleicoes2020/models/City.dart';
import 'package:eleicoes2020/screens/CandidatesScreen.dart';
import 'package:eleicoes2020/services/city.dart';
import 'package:flutter/material.dart';
import 'package:eleicoes2020/extension/string.dart';

class CitiesScreen extends StatefulWidget {
  final String state;
  final String codeOffice;

  CitiesScreen({Key key, @required this.state, @required this.codeOffice})
      : super(key: key);

  @override
  _CitiesScreenState createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen> {
  Future<List<City>> futureCities;

  @override
  void initState() {
    super.initState();
    futureCities = getCities(widget.state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(title: "Cidades"),
        body: Root(context,
            child: card.Card(
              child: Center(
                child: FutureBuilder(
                    future: futureCities,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return buildListCities(snapshot, context);
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }

                      return CircularProgressIndicator();
                    }),
              ),
            )));
  }

  Widget buildListCities(
      AsyncSnapshot<dynamic> snapshot, BuildContext context) {
    return ListView(
      children: snapshot.data.map<Widget>((City city) {
        var index = snapshot.data.indexOf(city);

        return Column(children: <Widget>[
          Material(
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
          if (index < snapshot.data.length - 1)
            Divider(
              height: 0,
              thickness: 1,
            )
        ]);
      }).toList(),
    );
  }
}
