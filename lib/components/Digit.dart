import 'package:flutter/material.dart';

class Digit extends StatelessWidget {
  final String number;
  final bool small;

  Digit({this.number, this.small: false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: small ? 1 : 4),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey[400]),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(small ? 2 : 8),
      child: Text(number,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: small ? 13 : 22, fontWeight: FontWeight.bold)),
    );
  }
}
