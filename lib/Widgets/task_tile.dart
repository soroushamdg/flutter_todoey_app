import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String title;
  final onChangeCallback;

  TaskTile({this.title, this.isChecked, this.onChangeCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: AnimatedDefaultTextStyle(
        style: TextStyle(
            fontSize: isChecked ? 15.0 : 21.0,
            color: Colors.black,
            decoration: isChecked ? TextDecoration.lineThrough : null),
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOutQuart,
        child: Text(
          title,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: onChangeCallback,
      ),
    );
  }
}
