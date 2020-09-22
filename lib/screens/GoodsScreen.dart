import 'package:eleicoes2020/models/Candidate.dart';
import 'package:flutter/material.dart';

class GoodsScreen extends StatelessWidget {
  final Candidate candidate;

  GoodsScreen({this.candidate});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Bens'),
    );
  }
}
