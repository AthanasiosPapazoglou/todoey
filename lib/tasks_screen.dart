//Η tasks_screen ειναι το ανώτερο επίπεδο της εφαρμογής και στεγάζει το home UI
//

import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'tasks_list.dart';
import 'add_task_screen.dart';
import 'task.dart';

List<Task> tasks = [
  Task(name: 'Buy milk'),
  Task(name: 'Buy eggs'),
  Task(name: 'Buy bread'),
];

String newTaskTitle = '';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,

      //Αυτο το button χρησιμοποιείται για να γίνει popup του modalsheet το οποιο φέρει τα απαραιτητα UI elements για να εισαγουμε
      //μια νεα τιμη καθως και την απαραιτητη λειτουργικοτητα για να τοποθετηθει η εγγραφη στη λιστα των todos
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => newRecordSheet((newTaskTitle) { // <=====================CALL POINT
              //ULTRA CARE! Αυτο εδω ειναι η ΛΕΙΤΟΥΡΓΙΑ της addTaskCallback
              setState(() {
                //που δηλωνουμε στη add_task_screen για να επιτελεσει το εργο αποστολης
                tasks.add(Task(name:newTaskTitle)); //της τιμης του textfield σε νεα εγγραφη στη λιστα των todo
              });
              Navigator.pop(context);
            }),
          );
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 60.0,
              left: 30.0,
              right: 30.0,
              bottom: 30.0,
            ),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.lightBlueAccent,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${tasks.length} Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 22.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: TaskList(tasks),  // <==============================================CALL POINT
            ),
          ),
        ],
      ),
    );
  }
}
