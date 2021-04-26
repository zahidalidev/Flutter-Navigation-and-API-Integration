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
      'label': 'Credit',
      'selected': false,
    },
    {
      'id': 3,
      'label': 'Refund',
      'selected': false,
    },
    {
      'id': 4,
      'label': 'Loan',
      'selected': false,
    },
    {
      'id': 5,
      'label': 'Direct Material',
      'selected': false,
    },
    {
      'id': 6,
      'label': 'Direct Labour',
      'selected': false,
    },
    {
      'id': 7,
      'label': 'Asset',
      'selected': false,
    },
    {
      'id': 8,
      'label': 'Other',
      'selected': false,
    },
    {
      'id': 9,
      'label': 'Overhead',
      'selected': false,
    },
  ];
  List checkBoxes2 = [
    {
      'id': 1,
      'label': 'Consultant Notes Only',
      'selected': false,
    },
    {
      'id': 2,
      'label': 'Overdue Only',
      'selected': false,
    },
    {
      'id': 3,
      'label': 'Date range',
      'selected': false,
    }
  ];

  String from = "";
  String to = "";

  var toggleButtonList = [false, true, false];

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

              // list of Check boxes
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

              const Divider(
                height: 10,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),

              // Toggle Button
              Container(
                margin: const EdgeInsets.only(top: 15),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Transaction Health",
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

                        // Buttons
                        children: [
                          ToggleButtons(
                            borderColor: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: CircleBorder(),
                                        primary: Colors.green,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          toggleButtonList[0] = true;
                                          toggleButtonList[1] = false;
                                          toggleButtonList[2] = false;
                                        });
                                      },
                                      child: Icon(
                                        Icons.thumb_up_alt_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Good",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: CircleBorder(),
                                        primary: Colors.orange,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          toggleButtonList[0] = false;
                                          toggleButtonList[1] = true;
                                          toggleButtonList[2] = false;
                                        });
                                      },
                                      child: Icon(
                                        Icons.thumb_down_alt_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Ok",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: CircleBorder(),
                                        primary: Colors.red,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          toggleButtonList[0] = false;
                                          toggleButtonList[1] = false;
                                          toggleButtonList[2] = true;
                                        });
                                      },
                                      child: Icon(
                                        Icons.thumb_down_alt_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Bad",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            ],
                            onPressed: (int index) {
                              setState(() {
                                for (int buttonIndex = 0;
                                    buttonIndex < toggleButtonList.length;
                                    buttonIndex++) {
                                  if (buttonIndex == index) {
                                    toggleButtonList[buttonIndex] = true;
                                  } else {
                                    toggleButtonList[buttonIndex] = false;
                                  }
                                }
                              });
                            },
                            isSelected: toggleButtonList,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // List of Check Boxes with divider
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                child: ListView.builder(
                  itemCount: checkBoxes2.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        child: Column(children: [
                      const Divider(
                        height: 10,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              checkBoxes2[index]['label'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Checkbox(
                            value: checkBoxes2[index]['selected'],
                            onChanged: (bool newValue) {
                              setState(() {
                                checkBoxes2[index]['selected'] = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                    ]));
                  },
                ),
              ),

              // Text Feilds
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    new Flexible(
                      child: SizedBox(
                        width: 150,
                        child: TextField(
                          controller: TextEditingController()..text = '-',
                          onChanged: (text) {
                            from = text;
                          },
                          decoration: InputDecoration(
                            labelText: 'From',
                          ),
                        ),
                      ),
                    ),
                    new Flexible(
                      child: SizedBox(
                        width: 150,
                        child: TextField(
                          controller: TextEditingController()..text = 'Today',
                          onChanged: (text) {
                            to = text;
                          },
                          decoration: InputDecoration(
                            labelText: 'To',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
