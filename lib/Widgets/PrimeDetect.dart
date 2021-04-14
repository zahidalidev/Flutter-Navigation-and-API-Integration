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
    if (number <= 1) {
      setState(() {
        isPrime = "Composite";
      });
      return;
    }
    for (int i = 2; i < number; i++) {
      if (number % i == 0) {
        setState(() {
          isPrime = "Composite";
        });
        print(isPrime);

        return;
      }
    }
    setState(() {
      isPrime = "Prime";
    });
    print(isPrime);
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      alignment: Alignment.center,
      // width: double.infinity,
      margin: const EdgeInsets.only(top: 70.0),
      // color: Colors.blue,
      // height: 110,
      // width: 200,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Text(
                    'Prime Number Detector',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.teal,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextField(
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
                      });
                    },
                  ),
                  ElevatedButton(
                    child: Text("Detect"),
                    onPressed: () {
                      detectPrime();
                    },
                  ),
                  Row(
                    children: [
                      Text(
                        'Detected Number is ',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.teal,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        isPrime,
                        style: TextStyle(
                          fontSize: 20,
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
