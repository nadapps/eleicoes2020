import 'package:eleicoes2020/models/Candidate.dart';
import 'package:flutter/material.dart';

class FinancesScreen extends StatelessWidget {
  final Candidate candidate;

  FinancesScreen({this.candidate});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Finançass'),
    );
  }
}
