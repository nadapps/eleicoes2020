import 'package:flutter/material.dart';

class Digit extends StatelessWidget {
  final String number;

  Digit({this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Color.fromRGBO(0, 0, 0, 0.3))),
      padding: EdgeInsets.all(8),
      child: Text(number,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
    );
  }
}
