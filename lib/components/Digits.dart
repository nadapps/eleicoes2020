import 'package:flutter/material.dart';

import 'Digit.dart';

class Digits extends StatelessWidget {
  final int number;
  final bool small;

  Digits({this.number, this.small});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: '${this.number}'.split('').map<Widget>((String digit) {
        return Digit(
          number: digit,
          small: this.small,
        );
      }).toList(),
    );
  }
}
