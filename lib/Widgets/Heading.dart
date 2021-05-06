import "package:flutter/material.dart";

class Heading extends StatelessWidget {
  final String label;
  Heading({this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: Colors.cyan,
        fontSize: 28,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
