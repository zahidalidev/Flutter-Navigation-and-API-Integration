import 'package:flutter/material.dart';

// Zahid Ali Regestration Number 2018-CS-136

class MyCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  MyCard({this.title, this.description, this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
      elevation: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Image.asset(image),
            // child: Image.asset("lib/assets/smash3.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
            child: Text(
              description,
              style:
                  TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 10, bottom: 10),
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
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
    );
  }
}
