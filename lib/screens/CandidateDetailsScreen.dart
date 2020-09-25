import 'package:eleicoes2020/models/Candidate.dart';
import 'package:eleicoes2020/components/Digit.dart';
import 'package:flutter/material.dart';

class CandidateDetailsScreen extends StatelessWidget {
  final Candidate candidate;

  CandidateDetailsScreen({this.candidate});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Container(
        child: Column(
          children: <Widget>[
            Text(
              candidate.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: '123'.split('').map<Widget>((String digit) {
                return Digit(number: digit);
              }).toList(),
            ))
          ],
        ),
      ),
    ));
  }
}
