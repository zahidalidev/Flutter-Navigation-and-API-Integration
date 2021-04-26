import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 2018-CS-136 Zahid Ali

class Assignment4AppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    // for responsive font
    double defaultScreenWidth = 400.0;
    double defaultScreenHeight = 810.0;
    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);

    return AppBar(
      automaticallyImplyLeading: false, //hide drawer icon
      leading: IconButton(
        icon: Icon(
          Icons.close,
          color: Colors.white,
        ),
        onPressed: () => {Navigator.pushNamed(context, '/')},
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
