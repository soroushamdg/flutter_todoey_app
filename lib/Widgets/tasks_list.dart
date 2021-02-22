import 'package:flutter/material.dart';
import 'package:todoey/Widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/tasks_provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksNotifierProvider>(
      builder: (context, tasksData, child) {
        return ListView.builder(
            padding: EdgeInsets.only(bottom: 90.0, left: 20.0, right: 20.0),
            itemCount: tasksData.count(),
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(tasksData.tasks[index].name),
                background: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.0),
                  color: Colors.redAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            'Remove',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                onDismissed: (direction) {
                  tasksData.removetask(index);
                },
                child: TaskTile(
                  title: tasksData.tasks[index].name,
                  isChecked: tasksData.tasks[index].isDone,
                  onChangeCallback: (value) {
                    tasksData.toggleTask(index);
                  },
                ),
              );
            });
      },
    );
  }
}
