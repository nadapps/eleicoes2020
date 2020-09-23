import 'package:eleicoes2020/components/Header.dart';
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
                child: TabBarView(
                  children: [
                    CandidateDetailsScreen(candidate: candidate),
                    GoodsScreen(candidate: candidate),
                    ElectionsScreen(candidate: candidate),
                    FinancesScreen(candidate: candidate),
                  ],
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
          labelColor: Colors.grey[600],
          unselectedLabelColor: Colors.blue,
          indicatorColor: Colors.red,
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
