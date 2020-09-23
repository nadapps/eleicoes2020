import 'package:flutter/material.dart';

class DropdownBorder extends StatelessWidget {
  final String value;
  final List<Widget> Function(BuildContext) selectedItemBuilder;
  final void Function(String) onChanged;
  final EdgeInsetsGeometry margin;
  final List<DropdownMenuItem<String>> items;

  DropdownBorder(
      {this.value,
      this.selectedItemBuilder,
      this.onChanged,
      this.margin,
      this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: this.margin,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Colors.white,
              width: 1,
            )),
        child: DropdownButton<String>(
          value: this.value,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
          selectedItemBuilder: this.selectedItemBuilder,
          isExpanded: true,
          elevation: 16,
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.white,
          ),
          underline: Container(
            height: 0,
          ),
          onChanged: this.onChanged,
          items: this.items,
        ));
  }
}
