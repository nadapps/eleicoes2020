import 'package:eleicoes2020/components/CardHome.dart';
import 'package:eleicoes2020/components/Header.dart';
import 'package:eleicoes2020/components/Menu.dart';
import 'package:eleicoes2020/components/Root.dart';
import 'package:eleicoes2020/repository/CandidateRepository.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final candidateRepository = CandidateRepository.instance;
  List<Map<String, dynamic>> mayors = [];
  List<Map<String, dynamic>> aldermans = [];

  @override
  void initState() {
    super.initState();
    readDB();
  }

  void readDB() async {
    List<Map<String, dynamic>> newMayors = await candidateRepository.allMayor();
    List<Map<String, dynamic>> newAldermans =
        await candidateRepository.allAlderman();

    setState(() {
      mayors = newMayors;
      aldermans = newAldermans;
    });
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
        key: Key('home-screen'),
        onVisibilityChanged: (visibilityInfo) {
          readDB();
        },
        child: Scaffold(
            drawer: Menu(),
            appBar: Header(title: "Eleições 2020"),
            body: Root(context,
                child: Column(
                  children: <Widget>[
                    CardHome(
                        title: "Suas opções de prefeito",
                        codeOffice: "11",
                        items: this.mayors),
                    CardHome(
                        title: "Suas opções de vereador",
                        codeOffice: "13",
                        items: this.aldermans),
                  ],
                ))));
  }
}
