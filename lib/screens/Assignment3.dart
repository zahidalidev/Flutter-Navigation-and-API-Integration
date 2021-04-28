import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_application_1/Widgets/MyAppBar.dart';
import 'package:flutter_application_1/Widgets/Drawer.dart';

// Zahid Ali Regestration Number 2018-CS-136

class Assignment3 extends StatefulWidget {
  Assignment3({Key key}) : super(key: key);

  @override
  _Assignment3 createState() => _Assignment3();
}

class _Assignment3 extends State<Assignment3> {
  List items = [
    {
      'id': 1,
      'title': 'Card 1 Title',
      'description':
          "Greyhound divisively hello coldly wonderfully marginally far upon excluding."
    },
    {
      'id': 2,
      'title': 'Card 2 Title',
      'description':
          "Greyhound divisively hello coldly wonderfully marginally far upon excluding."
    },
    {
      'id': 3,
      'title': 'Card 3 Title',
      'description':
          "Greyhound divisively hello coldly wonderfully marginally far upon excluding."
    },
    {
      'id': 4,
      'title': 'Card 4 Title',
      'description':
          "Greyhound divisively hello coldly wonderfully marginally far upon excluding."
    },
    {
      'id': 5,
      'title': 'Card 5 Title',
      'description':
          "Greyhound divisively hello coldly wonderfully marginally far upon excluding."
    },
    {
      'id': 6,
      'title': 'Card 6 Title',
      'description':
          "Greyhound divisively hello coldly wonderfully marginally far upon excluding."
    },
    {
      'id': 7,
      'title': 'Card 7 Title',
      'description':
          "Greyhound divisively hello coldly wonderfully marginally far upon excluding."
    },
  ];

  // Future<Post> products;
  Future<List<Product>> products;

  @override
  void initState() {
    super.initState();
    products = getProducts();
    print(products);
  }

  void dellItem(item, index) async {
    setState(() {
      items.remove(item);
    });

    final ConfirmAction action = await _asyncConfirmDialog(context);
    if (action != ConfirmAction.Accept) {
      setState(() {
        items.insert(index, item);
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
                  return Dismissible(
                    background: Container(color: Colors.red[300]),
                    key: Key(body.data[index].title),
                    onDismissed: (direction) {
                      dellItem(body.data[index], index);
                    },
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.only(
                          left: 30, right: 30, top: 10, bottom: 10),
                      elevation: 3,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Image.asset("lib/assets/smash3.jpg"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 16, right: 16),
                            child: Text(
                              body.data[index].description,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 10, bottom: 10),
                            child: ButtonBar(
                              alignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  body.data[index].title,
                                  style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 13),
                                      child: GestureDetector(
                                        child: Icon(
                                          Icons.favorite,
                                          color: Colors.grey,
                                          size: 25,
                                        ),
                                        onTap: () => null,
                                      ),
                                    ),
                                    GestureDetector(
                                      child: Icon(
                                        Icons.share,
                                        color: Colors.grey,
                                        size: 25,
                                      ),
                                      onTap: () => null,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (body.hasError) {
              return Text("tt:${body.error}");
            }

            // By default, it show a loading spinner.
            return CircularProgressIndicator();
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
    return parseData(response.body);
  } else {
    // If the response was umexpected, throw an error.
    throw Exception('Failed to load product');
  }
}

class Product {
  final int id;
  final String title;
  final String description;

  Product({this.id, this.title, this.description});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }
}
