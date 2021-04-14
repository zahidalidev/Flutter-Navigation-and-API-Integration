import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/PrimeDetect.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World Flutter Application',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Home page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  // This widget is the home page of your application.
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Face Detectio System'),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.account_circle_outlined,
                  size: 30,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Button is clicked')));
                  print("clicked");
                })
          ],
        ),
        body: PrimeDetectState());
  }
}
