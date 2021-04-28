import 'package:flutter/material.dart';

class CheckBoxListTitle extends StatelessWidget {
  final String label;
  final bool value;
  final Function change;

  CheckBoxListTitle({this.label, this.value, this.change});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Checkbox(
            value: value,
            onChanged: (bool newValue) {
              change(newValue);
            },
          ),
        ],
      ),
    );
  }
}
