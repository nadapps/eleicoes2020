import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  EmptyState({@required this.icon, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      this.icon,
                      color: Colors.grey[600],
                      size: 100,
                    ),
                    if (this.title != null)
                      Container(
                          margin: EdgeInsets.only(top: 16),
                          child: Text(
                            this.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w500),
                          )),
                    if (this.description != null)
                      Container(
                          margin: EdgeInsets.only(top: 16),
                          child: Text(
                            this.description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[700],
                            ),
                          ))
                  ],
                ))));
  }
}
