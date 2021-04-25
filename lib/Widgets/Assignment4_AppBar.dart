import 'package:flutter/material.dart';

class Assignment4AppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: new Container(
        child: Icon(Icons.close),
      ),
      title: Text('Sort & Filter'),
      actions: [
        TextButton(
          onPressed: () => null,
          child: const Text(
            'CLEAR',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: TextButton(
            onPressed: () => null,
            child: const Text(
              'APPLY',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
