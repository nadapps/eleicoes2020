import 'package:flutter/material.dart';

class Root extends Container {
  Root(BuildContext context,
      {Widget child, Color color, EdgeInsetsGeometry padding})
      : super(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: color ?? Color(0xff009F4F),
            child: child,
            padding: padding ?? EdgeInsets.all(16));
}
