import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/Drawer.dart';

// Zahid Ali Regestration Number 2018-CS-136

class Todays extends StatelessWidget {
  Todays({Key key, this.title}) : super(key: key);
  // This widget is the home page of your application.
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prime Number Detector'),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.account_circle_outlined,
                size: 30,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Icon is clicked')));
                print("clicked");
              })
        ],
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.65,
        child: DrawerWidget(),
      ),
      // imported from PrimeDetect
      body: Container(
          padding: EdgeInsets.only(left: 30, right: 30, top: 80),
          alignment: Alignment.center,
          color: Colors.white,
          child: Center(
            child: Text("Todays screen"),
          )),
    );
  }
}
