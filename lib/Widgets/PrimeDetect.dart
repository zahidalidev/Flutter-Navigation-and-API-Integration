import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Zahid Ali Regestration Number 2018-CS-136
// I have used all required Widgets

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
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Image.network(
                      'https://banner2.cleanpng.com/20180326/xae/kisspng-numbers-game-mathematics-numbers-game-prime-number-numbers-5ab8b109e77d78.5221715215220533859482.jpg',
                      height: 190,
                      width: 250,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        'Prime Number Detector',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.teal,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 75.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        style: TextStyle(),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Number',
                          hintText: 'Enter Number',
                        ),
                        onChanged: (String value) async {
                          setState(() {
                            isPrime = "Not detected";
                            number = int.parse(value);
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 25.0, bottom: 30),
                      child: ElevatedButton(
                        child: Text("Detect"),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          textStyle: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          detectPrime();
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Text(
                            'Detected Number is ',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.teal,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Text(
                          isPrime,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.teal,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
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
