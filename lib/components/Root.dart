import 'package:flutter/material.dart';

class Root extends Container {
  Root(BuildContext context, {Widget child})
      : super(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color(0xff009F4F),
            child: child,
            padding: EdgeInsets.all(16));
}
