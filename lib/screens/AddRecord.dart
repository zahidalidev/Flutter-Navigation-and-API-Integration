import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/AlertBox.dart';
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

    setState(() {
      message = addRecord(firstName, lastName, gender, email, phone);
    });
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
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'First Name'),
                      controller: firstnameController,
                    ),
                    Divider(
                      height: 2.0,
                    ),
                    TextField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Last Name'),
                      controller: lastnameController,
                    ),
                    Divider(
                      height: 2.0,
                    ),
                    TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'gender here'),
                      controller: genderController,
                    ),
                    Divider(
                      height: 2.0,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Email Address'),
                      controller: emailController,
                    ),
                    Divider(
                      height: 2.0,
                    ),
                    TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Phone Number'),
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
                        'Add Record',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            : FutureBuilder<Convert>(
                future: message,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return AlertBox(message: snapshot.data.message);
                  } else if (snapshot.hasError) {
                    return AlertBox(message: "${snapshot.error}");
                  }

                  return Center(child: CircularProgressIndicator());
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
    return Convert.fromJson(jsonDecode("{'message': 'Failed to Add Record.'}"));
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
