import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/Heading.dart';

// Zahid Ali Regestration Number 2018-CS-136

class PrimeDetectState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 80),
        alignment: Alignment.center,
        // color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Image.asset("lib/assets/CodeXLogo.png", height: 170),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 20, left: 30, right: 30),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(bottom: 20),
                            child: Heading(
                              label: "Assignment Description",
                            ),
                          ),
                          Text(
                            "1. Design Home Screen, add logo, short description of your assignment requirements; add drawer for navigation options to screens, designed in next steps \n\n2. Design Add Record Screen & Integrate Web API to add records; Add at least 5 records \n\n3. Design List Records. Integrate Web API to fetch records and then display them in tabular form, in this screen",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Zahid Ali Regestration Number 2018-CS-136
