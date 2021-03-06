import 'package:flutter/material.dart';
import 'package:todoey/Widgets/animated_icon.dart';
import 'package:todoey/Widgets/tasks_list.dart';
import 'package:todoey/models/tasks_provider.dart';
import 'package:todoey/screens/add_task_screen.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: GestureDetector(
        onLongPress: () {
          final snackBar = SnackBar(content: Text('List cleared!'));
          Provider.of<TasksNotifierProvider>(context, listen: false)
              .clearTasks();
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) =>
                    AddTaskScreen(onAddButtonTapCallback: (newTaskTitle) {
                      Provider.of<TasksNotifierProvider>(context, listen: false)
                          .addtask(newTaskTitle);
                      Navigator.pop(context);
                    }));
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Container(
              padding: EdgeInsets.only(
                  top: 30.0, left: 15.0, right: 15.0, bottom: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      AnimatedCheckIcon(),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Todoey',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    '${Provider.of<TasksNotifierProvider>(context).countnotdone()} tasks',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}
