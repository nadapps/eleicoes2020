import 'package:eleicoes2020/models/Candidate.dart';
import 'package:flutter/material.dart';

class CandidateDetailsScreen extends StatelessWidget {
  final Candidate candidate;

  CandidateDetailsScreen({this.candidate});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text(candidate.nickname),
    ));
  }
}
