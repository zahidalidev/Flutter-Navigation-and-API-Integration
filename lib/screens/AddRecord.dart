import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_application_1/Widgets/MyAppBar.dart';
import 'package:flutter_application_1/Widgets/Drawer.dart';
import 'package:flutter_application_1/Widgets/AlertBox.dart';
import 'package:flutter_application_1/Widgets/Heading.dart';

// Zahid Ali Regestration Number 2018-CS-136

class AddRecord extends StatefulWidget {
  @override
  _AddRecord createState() => _AddRecord();
}

class _AddRecord extends State<AddRecord> {
  TextEditingController firstNameCont = TextEditingController();
  TextEditingController lastNameCont = TextEditingController();
  TextEditingController genderCont = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumController = TextEditingController();

  Future<Convert> message;

  postRecord() {
    String firstName = firstNameCont.text;
    String lastName = lastNameCont.text;
    String gender = genderCont.text;
    String email = emailController.text;
    String phone = phoneNumController.text;

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
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.all(20.0),
        child: (message == null)
            ? SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(25),
                        child: Heading(
                          label: "Add TS Provider",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          // autofocus: true,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'First Name'),
                          controller: firstNameCont,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Last Name'),
                          controller: lastNameCont,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'gender here'),
                          controller: genderCont,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Email Address'),
                          controller: emailController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Phone Number'),
                          controller: phoneNumController,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                          onPressed: () async {
                            postRecord();
                          },
                          child: Text(
                            'Add Record',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : FutureBuilder<Convert>(
                future: message,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return AlertBox(
                      message: snapshot.data.message,
                      path: '/addRecords',
                    );
                  } else if (snapshot.hasError) {
                    return AlertBox(
                      message: "${snapshot.error}",
                      path: '/addRecords',
                    );
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
  var url = Uri.parse('http://bilalganjmarket.com/apis/persons.php');
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
    throw Exception('Failed to load product');
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

// Zahid Ali Regestration Number 2018-CS-136
