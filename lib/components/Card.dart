import 'package:flutter/material.dart';

class Card extends Container {
  Card({Widget child})
      : super(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: ClipRRect(
              child: child,
              borderRadius: BorderRadius.circular(16),
            ));
}
