import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/Assignment4_AppBar.dart';
import 'package:flutter_application_1/Widgets/CheckBoxListTitle.dart';
import 'package:flutter_application_1/Widgets/Drawer.dart';
import 'package:flutter_application_1/Widgets/Heading.dart';

// 2018-CS-136 Zahid Ali

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
  var transactionButtons = [false, true];

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
                child: Heading(label: "Sort by"),
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
                    Heading(label: "Transaction types"),

                    // Toggle Button
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              // Buttons
                              children: [
                                ToggleButtons(
                                  borderColor: Colors.black,
                                  borderRadius: BorderRadius.circular(10),
                                  borderWidth: 1.5,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 22,
                                          bottom: 22,
                                          left: 35,
                                          right: 35),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Money In",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 19,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 22,
                                          bottom: 22,
                                          left: 35,
                                          right: 35),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Money Out",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 19,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                  onPressed: (int index) {
                                    setState(() {
                                      for (int buttonIndex = 0;
                                          buttonIndex <
                                              transactionButtons.length;
                                          buttonIndex++) {
                                        if (buttonIndex == index) {
                                          transactionButtons[buttonIndex] =
                                              true;
                                        } else {
                                          transactionButtons[buttonIndex] =
                                              false;
                                        }
                                      }
                                    });
                                  },
                                  isSelected: transactionButtons,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // List of Custom checkbox list tile
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                child: ListView.builder(
                  primary: false,
                  itemCount: checkBoxes.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return CheckBoxListTitle(
                      label: checkBoxes[index]['label'],
                      value: checkBoxes[index]['selected'],
                      change: (value) => {
                        setState(() {
                          checkBoxes[index]['selected'] = value;
                        })
                      },
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
                    Heading(label: "Transaction Health"),
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

              // Custom checkbox list tile with divider
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                child: ListView.builder(
                  primary: false,
                  itemCount: checkBoxes2.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return CheckBoxListTitle(
                      label: checkBoxes2[index]['label'],
                      value: checkBoxes2[index]['selected'],
                      change: (value) => {
                        setState(() {
                          checkBoxes2[index]['selected'] = value;
                        })
                      },
                    );
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
