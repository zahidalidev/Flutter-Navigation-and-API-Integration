import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_application_1/Widgets/MyAppBar.dart';
import 'package:flutter_application_1/Widgets/Drawer.dart';
// Zahid Ali Regestration Number 2018-CS-136

class AddRecord extends StatefulWidget {
  @override
  _AddRecord createState() => _AddRecord();
}

class _AddRecord extends State<AddRecord> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Future<Convert> message;

  postRecord() {
    String firstName = firstnameController.text;
    String lastName = lastnameController.text;
    String gender = genderController.text;
    String email = emailController.text;
    String phone = phoneController.text;

    message = addRecord(firstName, lastName, gender, email, phone);
    print('message');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.65,
        child: DrawerWidget(),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: (message == null)
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      //keyboardType: TextInputType.firstname,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter first Name'),
                      controller: firstnameController,
                    ),
                    Divider(
                      height: 2.0,
                    ),
                    TextField(
                      //keyboardType: TextInputType.firstname,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Last Name'),
                      controller: lastnameController,
                    ),
                    Divider(
                      height: 2.0,
                    ),
                    TextField(
                      //keyboardType: TextInputType.firstname,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter gender here'),
                      controller: genderController,
                    ),
                    Divider(
                      height: 2.0,
                    ),
                    TextField(
                      //keyboardType: TextInputType.firstname,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter email here'),
                      controller: emailController,
                    ),
                    Divider(
                      height: 2.0,
                    ),
                    TextField(
                      //keyboardType: TextInputType.firstname,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter phone here'),
                      controller: phoneController,
                    ),
                    Divider(
                      height: 2.0,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        postRecord();
                      },
                      child: Text(
                        'Send Data',
                      ),
                    ),
                  ],
                ),
              )
            : FutureBuilder<Convert>(
                future: message,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // return Text(snapshot.data.message);
                    return showAlertDialog(context);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                    // return Text("${snapshot.error}");
                  }

                  return CircularProgressIndicator();
                },
              ),
      ),
    );
  }
}

Future<Convert> addRecord(String firstName, String lastName, String gender,
    String email, String phone) async {
  var url = Uri.parse('https://pcc.edu.pk/ws/create/ts_providers.php');
  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      "firstName": firstName,
      "lastName": lastName,
      "gender": gender,
      "email": email,
      "phone": phone
    }),
  );

  if (response.statusCode == 200) {
    return Convert.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to Add Record.');
  }
}

class Convert {
  final String message;

  Convert({this.message});

  factory Convert.fromJson(Map<String, dynamic> json) {
    return Convert(
      message: json['message'],
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {},
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Simple Alert"),
    content: Text("This is an alert message."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
