import 'package:flutter/material.dart';
import 'package:todoey/tasks_screen.dart';
import 'task_tile.dart';
import 'task.dart';
import 'tasks_screen.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;

  TaskList(this.tasks); 

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            taskTitle: tasks[index].name,
            isChecked: tasks[index].isDone,
            checkboxCallback: (checkboxState) {
              setState(() {
                tasks[index].toggleDone();
              });
            });
      },
      itemCount: tasks.length,
    );
  }
}
