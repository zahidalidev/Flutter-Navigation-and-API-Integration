import 'package:flutter/material.dart';

class CodeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 165.0),
          // color: Colors.blue,
          child: Column(
            children: [
              Container(
                child: const Text(
                  'MARK ATTEDANCE',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.teal,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 65.0, left: 30, right: 30),
                child: TextField(
                  // obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Attendance Code',
                    hintText: 'Enter Code',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
