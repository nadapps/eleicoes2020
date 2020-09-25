import 'package:eleicoes2020/enuns/Sex.dart';
import 'package:eleicoes2020/models/Candidate.dart';
import 'package:eleicoes2020/components/Digit.dart';
import 'package:eleicoes2020/components/TitledText.dart';
import 'package:flutter/material.dart';

class CandidateDetailsScreen extends StatelessWidget {
  final Candidate candidate;

  CandidateDetailsScreen({this.candidate});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            child: Center(
      child: Container(
        child: Column(
          children: [
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text(
                    candidate.nickname,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: '${candidate.number}'
                      .split('')
                      .map<Widget>((String digit) {
                    return Digit(number: digit);
                  }).toList(),
                ))
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Divider(
                height: 1,
                color: Colors.grey[600],
              ),
            ),
            Column(children: [
              Text(
                'Redes sociais',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ]),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Divider(
                height: 1,
                color: Colors.grey[600],
              ),
            ),
            Column(children: [
              Text(
                candidate.sex == Sex.MALE
                    ? 'Dados do candidato'
                    : 'Dados da candidata',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    TitledText(
                      title: 'Nome completo',
                      text: candidate.name,
                    ),
                    TitledText(
                      title: 'Ocupação',
                      text: candidate.officeName,
                    ),
                    TitledText(
                      title: 'Sexo',
                      text:
                          candidate.sex == Sex.MALE ? 'Masculino' : 'Feminino',
                    ),
                    TitledText(
                      title: 'Coligação',
                      text: candidate.coalition,
                    ),
                    TitledText(
                      title: 'Partidos',
                      text: candidate.party.initials,
                    ),
                  ],
                ),
              )
            ]),
          ],
        ),
      ),
    )));
  }
}
