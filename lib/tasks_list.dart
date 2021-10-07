//Φτιαχνει τη δομη του listView που θα απεικονιζει τα ToDο.
//ΠΡΟΣΟΧΗ. Δεν δομει την ιδια τη λιστα. Αυτη ΗΔΗ υπάρχει στο array <Tasks> και στέλνεται ως argument στη TaskList
//Η TaskList με χρηση ListView.builder ΦΤΙΑΧΝΕΙ ενα ενα τα items του ListView με τη UI μορφη που θελουμε να εχουν
//Συγκεκριμενα καθε item που δομείται ειναι ενα widget τυπου ListTile
//Τα items ειναι τυπου ListTile δηλαδη single child row με text & icon (το icon μας θελουμε να ειναι checkbox)

//ΠΡΟΣΟΧΗ δεν επιστρέφουμε ακριβως items τυπου ListTile αλλα TaskTile
//Το TaskTile ειναι ενα δικο μας custom widget το οποίο εν τελει επιστρέφει items/widgets τυπου ListTile
//Ο λογος υπαρξης του TaskTile ειναι η αναγκη δημιουργιας συγκεκριμενης μορφής item τυπου ListTile 

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
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskTile( // <==================================CALL POINT
            taskTitle: tasks[index].name,
            isChecked: tasks[index].isDone,
            checkboxCallback: (checkboxState) {
              setState(() {
                tasks[index].toggleDone();
              });
            });
      },
    );
  }
}

//Ο builder στο προσκήνιο εκτελεί επανάληψη, δηλαδή δομεί κάθε στοιχείο της λίστας ως widget με τροπο που υπαγορεύει αυτο που ακολουθεί
//μετά απο το return του. H TaskTile ειναι custom widget που καανει return instances παιδιων τυπου ListTile αλλα με encapsulated 
//custom λειτουργικότητα και μορφή. Προφανώς ορισμένη απο εμας με σκοπο να δειχνει ενα τιτλο με checkbox που αν ειναι ticked διαγραφεται
// η λεζαντα του title
