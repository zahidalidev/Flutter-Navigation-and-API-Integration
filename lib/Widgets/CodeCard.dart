import 'package:flutter/material.dart';

class CodeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(15.0),
          // color: Colors.blue,
          //
          child: Row(
            children: [
              Expanded(
                child: Text('Peter', textAlign: TextAlign.center),
              ),
              Expanded(
                child: Text('John', textAlign: TextAlign.center),
              ),
              Expanded(
                child: FittedBox(
                  fit: BoxFit.contain, // otherwise the logo will be tiny
                  child: const FlutterLogo(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
