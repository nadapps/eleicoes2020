import 'package:flutter/material.dart';

class TitledText extends StatelessWidget {
  final String title;
  final String text;

  TitledText({this.title, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: Colors.grey[400]))),
      child: Row(children: [
        Container(
          width: 100,
          child: Text(
            this.title,
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          child: Expanded(
              child: Text(this.text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 11))),
        ),
      ]),
    );
  }
}
