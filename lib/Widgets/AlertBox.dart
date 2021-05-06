import 'package:flutter/material.dart';

// Zahid Ali Regestration Number 2018-CS-136

class AlertBox extends StatelessWidget {
  // final String title;
  final String message;
  final String path;
  AlertBox({this.message, this.path});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Alert'),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pushNamed(path);
          },
        )
      ],
    );
  }
}
