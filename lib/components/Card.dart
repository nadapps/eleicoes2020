import 'package:flutter/material.dart';

class Card extends Container {
  Card({Widget child})
      : super(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: child);
}
