import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/Assignment4_AppBar.dart';
import 'package:flutter_application_1/Widgets/Drawer.dart';

class Assignment4 extends StatefulWidget {
  @override
  _Assignment4 createState() => _Assignment4();
}

class _Assignment4 extends State<Assignment4> {
  String sortDropDown = 'Newest First';
  List dropDownList = [
    'Newest First',
    'Oldest First',
    'Value Hight-Low',
    'Value Low-Hight',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Assignment4AppBar(),
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.65,
        child: DrawerWidget(),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    text: 'Sort by',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('Sort by"');
                      },
                  ),
                ),
              ),

              // Drop Down
              Container(
                alignment: Alignment.centerLeft,
                child: DropdownButton<String>(
                  value: sortDropDown,
                  icon: const Icon(null),
                  elevation: 16,
                  style: const TextStyle(color: Colors.black54, fontSize: 18),
                  onChanged: (String newValue) {
                    setState(() {
                      sortDropDown = newValue;
                    });
                  },
                  items: <String>[...dropDownList]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),

              const Divider(
                height: 10,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),
            ],
          )
        ],
      ),
    );
  }
}
