import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/Card.dart';
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
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Dismissible(
              background: Container(color: Colors.red[300]),
              key: Key(items[index]['title']),
              onDismissed: (direction) {
                dellItem(items[index], index);
              },
              child: MyCard(
                title: items[index]['title'],
                description: items[index]['description'],
                image: "lib/assets/smash3.jpg",
              ),
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
