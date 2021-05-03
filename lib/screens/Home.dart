import 'package:flutter/material.dart';

// Zahid Ali Regestration Number 2018-CS-136

class PrimeDetectState extends StatefulWidget {
  @override
  PrimeDetect createState() => PrimeDetect();
}

class PrimeDetect extends State<PrimeDetectState> {
  int number;
  String isPrime = "Not detected";

  //Funtion to check prime number
  void detectPrime() {
    if (number == null) {
      setState(() {
        isPrime = "Not detected";
      });
      return;
    } else {
      if (number <= 1) {
        setState(() {
          isPrime = "Composite";
          number = null;
        });
        return;
      }
      for (int i = 2; i < number; i++) {
        if (number % i == 0) {
          setState(() {
            isPrime = "Composite";
            number = null;
          });

          return;
        }
      }
      setState(() {
        isPrime = "Prime";
        number = null;
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(left: 30, right: 30, top: 80),
        alignment: Alignment.center,
        // color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Image.asset("lib/assets/numbers.png",
                        height: 190, width: 250),
                    Container(
                      margin: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        'description here',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.teal,
                          fontWeight: FontWeight.w400,
                        ),
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
