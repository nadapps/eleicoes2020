import 'package:eleicoes2020/components/Card.dart' as card;
import 'package:eleicoes2020/components/Header.dart';
import 'package:eleicoes2020/components/Root.dart';
import 'package:eleicoes2020/models/Candidate.dart';
import 'package:eleicoes2020/screens/CandidateScreen.dart';
import 'package:eleicoes2020/services/candidate.dart';
import 'package:flutter/material.dart';

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
            child: card.Card(
              child: Center(
                child: FutureBuilder(
                    future: futureCandidates,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return buildListCandidate(snapshot, context);
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }

                      return CircularProgressIndicator();
                    }),
              ),
            )));
  }

  Widget buildListCandidate(
      AsyncSnapshot<dynamic> snapshot, BuildContext context) {
    return ListView(
      children: snapshot.data.map<Widget>((Candidate candidate) {
        var index = snapshot.data.indexOf(candidate);

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
                        ),
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
