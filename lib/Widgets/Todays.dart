import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/MyAppBar.dart';
import 'package:flutter_application_1/Widgets/Drawer.dart';

// Zahid Ali Regestration Number 2018-CS-136

class Todays extends StatefulWidget {
  Todays({Key key}) : super(key: key);

  @override
  _Todays createState() => _Todays();
}

class _Todays extends State<Todays> {
  List items = [
    {
      'id': 1,
      'title': 'Card 1 Tiyle, Lyrics by Sidney Stein',
    },
    {
      'id': 2,
      'title': 'Card 2 Tiyle, Lyrics by Sidney Stein',
    },
    {
      'id': 3,
      'title': 'Card 3 Tiyle, Lyrics by Sidney Stein',
    },
    {
      'id': 4,
      'title': 'Card 4 Tiyle, Lyrics by Sidney Stein',
    },
    {
      'id': 5,
      'title': 'Card 5 Tiyle, Lyrics by Sidney Stein',
    },
    {
      'id': 6,
      'title': 'Card 6 Tiyle, Lyrics by Sidney Stein',
    },
    {
      'id': 7,
      'title': 'Card 7 Tiyle, Lyrics by Sidney Stein',
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
              background: Container(color: Colors.red),
              key: Key(items[index]['title']),
              onDismissed: (direction) {
                dellItem(items[index], index);
              },
              child: Card(
                margin:
                    EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                elevation: 3,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Image.asset("lib/assets/smash3.jpg", height: 160),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding:
                              EdgeInsets.only(left: 20, bottom: 18, top: 2),
                          child: Text(
                            items[index]['title'],
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Padding(
                          padding:
                              EdgeInsets.only(right: 20, bottom: 18, top: 2),
                          child: GestureDetector(
                            child: Icon(
                              Icons.delete_forever,
                              color: Colors.red,
                              size: 25,
                            ),
                            // onTap: () {
                            //   dellItem(items[index]);
                            // },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
