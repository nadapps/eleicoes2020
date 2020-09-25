import 'package:eleicoes2020/components/Card.dart' as card;
import 'package:eleicoes2020/components/EmptyState.dart';
import 'package:eleicoes2020/components/Header.dart';
import 'package:eleicoes2020/components/Root.dart';
import 'package:eleicoes2020/models/Candidate.dart';
import 'package:eleicoes2020/screens/CandidateScreen.dart';
import 'package:eleicoes2020/services/candidate.dart';
import 'package:flutter/material.dart';
import 'package:eleicoes2020/extension/iterable.dart';

class CandidatesScreen extends StatefulWidget {
  final String state;
  final String city;
  final String codeOffice;

  CandidatesScreen(
      {Key key,
      @required this.state,
      @required this.city,
      @required this.codeOffice})
      : super(key: key);

  @override
  _CandidatesScreenState createState() => _CandidatesScreenState();
}

class _CandidatesScreenState extends State<CandidatesScreen> {
  String search = '';
  Future<List<Candidate>> futureCandidates;

  @override
  void initState() {
    super.initState();
    futureCandidates = getCandidates(widget.city, widget.codeOffice);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(title: "Candidatos"),
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
                        hintText: 'Buscar candidato...'),
                  )),
              Expanded(
                  child: card.Card(
                child: FutureBuilder(
                    future: futureCandidates,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Candidate> list =
                            new List<Candidate>.from(snapshot.data)
                                .where((Candidate city) =>
                                    city.toEqualSearch(search))
                                .toList();

                        if (list.length == 0) {
                          return EmptyState(
                              title: 'Oh! A lista está vazia',
                              description:
                                  'Faça uma busca diferente ou acesse outra lista de cidades.',
                              icon: Icons.format_list_bulleted);
                        }

                        return buildListCandidate(list, context);
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

  Widget buildListCandidate(List<Candidate> list, BuildContext context) {
    return ListView(
      children: list.mapIndex<Widget>((Candidate candidate, int index) {
        return Column(children: <Widget>[
          Material(
              child: (InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CandidateScreen(
                            city: widget.city,
                            candidateCode: candidate.id,
                            officeCode: widget.codeOffice,
                            state: widget.state),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/user-image.jpg"),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 18.0,
                    ),
                    title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            candidate.nickname,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '${candidate.party.initials} - ${candidate.coalition}',
                            overflow: TextOverflow.ellipsis,
                          )
                        ]),
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
