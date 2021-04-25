// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/Drawer.dart';
import 'package:flutter_application_1/Widgets/MyAppBar.dart';

class Assignment4 extends StatefulWidget {
  @override
  _Assignment4 createState() => _Assignment4();
}

class _Assignment4 extends State<Assignment4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.65,
        child: DrawerWidget(),
      ),
    );
  }
}
