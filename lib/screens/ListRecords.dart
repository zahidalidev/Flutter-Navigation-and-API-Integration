import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/Card.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_application_1/Widgets/MyAppBar.dart';
import 'package:flutter_application_1/Widgets/Drawer.dart';

// Zahid Ali Regestration Number 2018-CS-136

class ListRecords extends StatefulWidget {
  ListRecords({Key key}) : super(key: key);

  @override
  _ListRecords createState() => _ListRecords();
}

class _ListRecords extends State<ListRecords> {
  Future<List<Product>> products;

  @override
  void initState() {
    super.initState();
    products = getProducts();
  }

  void dellItem(item, index) async {
    setState(() {
      // products.removeWhere((item) => item.id == '001');
      // products.remove(item);
    });

    final ConfirmAction action = await _asyncConfirmDialog(context);
    if (action != ConfirmAction.Accept) {
      setState(() {
        // products.insert(index, item);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.65,
        child: DrawerWidget(),
      ),
      // imported from PrimeDetect
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: FutureBuilder<List<Product>>(
          future: products,
          builder: (context, body) {
            if (body.hasData) {
              return ListView.builder(
                itemCount: body.data.length,
                itemBuilder: (context, index) {
                  return Table(
                    defaultColumnWidth: FixedColumnWidth(120.0),
                    border: TableBorder.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 2),
                    children: [
                      TableRow(children: [
                        Column(children: [
                          Text('Website', style: TextStyle(fontSize: 20.0))
                        ]),
                        Column(children: [
                          Text('Tutorial', style: TextStyle(fontSize: 20.0))
                        ]),
                        Column(children: [
                          Text('Review', style: TextStyle(fontSize: 20.0))
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: [Text('Javatpoint')]),
                        Column(children: [Text('Flutter')]),
                        Column(children: [Text('5*')]),
                      ]),
                      TableRow(children: [
                        Column(children: [Text('Javatpoint')]),
                        Column(children: [Text('MySQL')]),
                        Column(children: [Text('5*')]),
                      ]),
                      TableRow(children: [
                        Column(children: [Text('Javatpoint')]),
                        Column(children: [Text('ReactJS')]),
                        Column(children: [Text('5*')]),
                      ]),
                    ],
                  );
                },
              );
            } else if (body.hasError) {
              return Center(
                child: Text("tt:${body.error}"),
              );
            }

            // By default, it show a loading spinner.
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

enum ConfirmAction { Cancel, Accept }
Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Delete This Card?'),
        content: const Text('This will delete the Card from Todays list.'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.Cancel);
            },
          ),
          TextButton(
            child: const Text('Delete'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.Accept);
            },
          )
        ],
      );
    },
  );
}

// Future<http.Response> getProducts() {
//   return http.get(
//       "https://my-json-server.typicode.com/zahidalidev/fakeProduct/products");
// }

List<Product> parseData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Product>((json) => Product.fromJson(json)).toList();
}

Future<List<Product>> getProducts() async {
  final response = await http.get(
      "https://my-json-server.typicode.com/zahidalidev/fakeProduct/products");

  if (response.statusCode == 200) {
    // If the server returns an OK response, then parse the JSON.
    // return json.decode(response.body);
    return parseData(response.body);
  } else {
    // If the response was umexpected, throw an error.
    throw Exception('Failed to load product');
  }
}

class Product {
  final int id;
  final String firstName;
  final String lastName;
  final String gender;
  final String email;
  final String phone;

  Product(
      {this.id,
      this.firstName,
      this.lastName,
      this.gender,
      this.email,
      this.phone});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
      email: json['email'],
      phone: json['phone'],
    );
  }
}
