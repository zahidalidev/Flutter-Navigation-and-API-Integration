import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimeDetectState extends StatefulWidget {
  @override
  PrimeDetect createState() => PrimeDetect();
}

class PrimeDetect extends State<PrimeDetectState> {
  int number;
  String isPrime = "Not detected";

  //Funtion to check prime number
  void detectPrime() {
    print(isPrime);
    print(number);

    if (number == null) {
      setState(() {
        isPrime = "Not detected";
      });
      return;
    }

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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      alignment: Alignment.center,
      // width: double.infinity,
      color: Colors.white,
      // margin: const EdgeInsets.only(top: 50.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Image.network(
                    'https://banner2.cleanpng.com/20180326/xae/kisspng-numbers-game-mathematics-numbers-game-prime-number-numbers-5ab8b109e77d78.5221715215220533859482.jpg',
                    height: 250,
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
                          number = int.parse(value);
                          isPrime = "Not detected";
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 25.0, bottom: 30),
                    child: ElevatedButton(
                      child: Text("Detect"),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        textStyle: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        detectPrime();
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Detected Number is ',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.teal,
                          fontWeight: FontWeight.w400,
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
    );
  }
}
