import 'package:flutter/material.dart';

class Card extends Container {
  Card({Widget child, EdgeInsets padding, EdgeInsets margin})
      : super(
            margin: margin,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: ClipRRect(
              child: Container(padding: padding, child: child),
              borderRadius: BorderRadius.circular(16),
            ));
}
