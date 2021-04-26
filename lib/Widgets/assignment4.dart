import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/Assignment4_AppBar.dart';
import 'package:flutter_application_1/Widgets/Drawer.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

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

  List checkBoxes = [
    {
      'id': 1,
      'label': 'Sale',
      'selected': false,
    },
    {
      'id': 2,
      'label': 'redit',
      'selected': false,
    },
    {
      'id': 3,
      'label': 'Sale',
      'selected': false,
    },
    {
      'id': 4,
      'label': 'Sale',
      'selected': false,
    },
    {
      'id': 5,
      'label': 'Sale',
      'selected': false,
    },
    {
      'id': 6,
      'label': 'Sale',
      'selected': false,
    },
    {
      'id': 7,
      'label': 'Sale',
      'selected': false,
    },
    {
      'id': 8,
      'label': 'Sale',
      'selected': false,
    },
    {
      'id': 9,
      'label': 'Sale',
      'selected': false,
    },
  ];

  bool _isSelected = false;

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
                child: Text(
                  "Sort by",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              // Drop Down
              Container(
                alignment: Alignment.centerLeft,
                child: DropdownButton<String>(
                  value: sortDropDown,
                  icon: const Icon(null), //remove icon
                  elevation: 16,
                  style: const TextStyle(color: Colors.black54, fontSize: 18),
                  underline: SizedBox(), //remove underlnie
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

              // Transactions types
              Container(
                margin: const EdgeInsets.only(top: 15),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Transaction types",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                            onPressed: () => null,
                            style: OutlinedButton.styleFrom(
                              primary: Colors.black,
                              side: BorderSide(color: Colors.black, width: 2),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: const Text(
                                "Money In",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () => null,
                            style: OutlinedButton.styleFrom(
                              primary: Colors.black,
                              side: BorderSide(color: Colors.black, width: 2),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: const Text(
                                "Money Out",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Check boxes
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                child: ListView.builder(
                  itemCount: checkBoxes.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              checkBoxes[index]['label'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Checkbox(
                            value: checkBoxes[index]['selected'],
                            onChanged: (bool newValue) {
                              setState(() {
                                checkBoxes[index]['selected'] = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
