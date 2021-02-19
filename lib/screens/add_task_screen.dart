import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final Function onAddButtonTapCallback;
  String textfieldText;

  AddTaskScreen({this.onAddButtonTapCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Add task',
                  textAlign: TextAlign.center,
                ),
                TextField(
                  autofocus: true,
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                  onChanged: (text) {
                    textfieldText = text;
                  },
                ),
                FlatButton(
                  onPressed: () {
                    onAddButtonTapCallback(textfieldText);
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
