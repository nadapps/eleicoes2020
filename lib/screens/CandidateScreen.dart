import 'package:eleicoes2020/components/Card.dart' as card;
import 'package:eleicoes2020/components/Root.dart';
import 'package:eleicoes2020/models/Candidate.dart';
import 'package:eleicoes2020/screens/CandidateDetailsScreen.dart';
import 'package:eleicoes2020/screens/ElectionsScreen.dart';
import 'package:eleicoes2020/screens/FinancesScreen.dart';
import 'package:eleicoes2020/screens/GoodsScreen.dart';
import 'package:eleicoes2020/services/candidate.dart';
import 'package:flutter/material.dart';

class CandidateScreen extends StatefulWidget {
  final String city;
  final int candidateCode;

  CandidateScreen({Key key, @required this.city, @required this.candidateCode})
      : super(key: key);

  @override
  _CandidateScreenState createState() => _CandidateScreenState();
}

class _CandidateScreenState extends State<CandidateScreen> {
  Future<Candidate> futureCandidate;

  @override
  void initState() {
    super.initState();
    futureCandidate = getCandidate(widget.city, widget.candidateCode);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureCandidate,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Candidate candidate = snapshot.data;

            return buildTabs(
                backgroundColor: candidate.party.color,
                title: candidate.nickname,
                context: context,
                child: Root(
                  context,
                  color: candidate.party.color,
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child:
                      Stack(alignment: Alignment.topCenter, children: <Widget>[
                    Column(children: <Widget>[
                      Expanded(
                          child: Container(
                              margin: EdgeInsets.only(top: 120),
                              child: card.Card(
                                  child: (TabBarView(
                                children: [
                                  CandidateDetailsScreen(candidate: candidate),
                                  GoodsScreen(candidate: candidate),
                                  ElectionsScreen(candidate: candidate),
                                  FinancesScreen(candidate: candidate),
                                ],
                              )))))
                    ]),
                    Positioned(
                        top: 10,
                        child: Row(children: <Widget>[
                          Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 5, color: Colors.grey[400])),
                              child: Image.network(candidate.photo,
                                  fit: BoxFit.cover, height: 150)),
                          Container(
                              margin: EdgeInsets.only(left: 25),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 5, color: Colors.grey[400])),
                              child: Image(
                                  image: AssetImage(candidate.party.image),
                                  fit: BoxFit.cover,
                                  width: 100)),
                        ]))
                  ]),
                ));
          } else if (snapshot.hasError) {
            return buildTabs(
                context: context, child: Text("${snapshot.error}"));
          }

          return buildTabs(
              context: context,
              child: Center(child: CircularProgressIndicator()));
        });
  }

  Widget buildTabs(
      {BuildContext context,
      Widget child,
      Color backgroundColor,
      String title}) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.person)),
            Tab(icon: Icon(Icons.attach_money)),
            Tab(icon: Icon(Icons.star)),
            Tab(icon: Icon(Icons.account_balance)),
          ],
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: Colors.grey[800], width: 3.0),
            insets: EdgeInsets.fromLTRB(0.0, 0.0, 00.0, 45.0),
          ),
          labelColor: Colors.grey[800],
          unselectedLabelColor: Colors.grey[500],
        ),
        appBar: title == null
            ? null
            : AppBar(
                elevation: 0,
                automaticallyImplyLeading: true,
                backgroundColor: backgroundColor ?? const Color(0xffFEB300),
                iconTheme: IconThemeData(color: Colors.white),
                title: Text(
                  title,
                  style: TextStyle(color: Colors.white),
                ),
              ),
        body: child,
      ),
    );
  }
}