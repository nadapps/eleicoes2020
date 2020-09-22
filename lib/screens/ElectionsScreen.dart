import 'package:eleicoes2020/models/Candidate.dart';
import 'package:flutter/material.dart';

class ElectionsScreen extends StatelessWidget {
  final Candidate candidate;

  ElectionsScreen({this.candidate});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Eleições'),
    );
  }
}
