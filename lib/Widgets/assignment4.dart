// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/Assignment4_AppBar.dart';
import 'package:flutter_application_1/Widgets/Drawer.dart';

class Assignment4 extends StatefulWidget {
  @override
  _Assignment4 createState() => _Assignment4();
}

class _Assignment4 extends State<Assignment4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Assignment4AppBar(),
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.65,
        child: DrawerWidget(),
      ),
    );
  }
}
