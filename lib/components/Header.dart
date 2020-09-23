import 'package:flutter/material.dart';

class Header extends AppBar {
  Header(
      {String title,
      PreferredSizeWidget bottom,
      Color backgroundColor,
      Color color,
      elevation: double})
      : super(
          bottom: bottom,
          backgroundColor: backgroundColor ?? const Color(0xffFEB300),
          iconTheme: IconThemeData(color: color ?? Colors.black),
          title: Text(
            title,
            style: TextStyle(color: color ?? Colors.black),
          ),
        );
}
