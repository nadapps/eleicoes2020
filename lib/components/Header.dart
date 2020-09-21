import 'package:flutter/material.dart';

class Header extends AppBar {
  Header({String title})
      : super(
          backgroundColor: const Color(0xffFEB300),
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
        );
}
