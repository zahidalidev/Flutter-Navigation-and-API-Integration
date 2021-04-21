import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Verido'),
      actions: [
        IconButton(
            icon: const Icon(
              Icons.account_circle_outlined,
              size: 30,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Icon is clicked')));
              print("clicked");
            })
      ],
    );
  }
}
