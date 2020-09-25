import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NumberDescription extends StatelessWidget {
  final double value;
  final String description;
  final Color color;
  final bool large;
  final formatCurrency = new NumberFormat.simpleCurrency(locale: 'pt-BR');

  NumberDescription(
      {@required this.value,
      @required this.description,
      this.color,
      this.large = false});

  @override
  Widget build(BuildContext context) {
    if (this.large) {
      return Container(
          margin: EdgeInsets.only(bottom: 16),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
                Container(
                    child: AutoSizeText(
                  "${formatCurrency.format(value)}",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                    color: color ?? Colors.blue[300],
                  ),
                ))
              ]));
    } else {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              description,
              style: TextStyle(fontSize: 11),
            ),
            AutoSizeText(
              "${formatCurrency.format(value)}",
              maxLines: 1,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: color ?? Colors.blue[300],
              ),
            )
          ]);
    }
  }
}
