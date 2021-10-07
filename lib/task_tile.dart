
//custom Widget που δομει μια εγγραφη σε customised μορφη ListTile
//δεχεται 3 arguments. Τιτλο μεμονομενου todo, κατασταση checkbox, CBfunction για λειτουργικοτητα του checkbox


import 'package:flutter/material.dart';
import 'package:todoey/tasks_screen.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked; //στεγαζει value για το αν ειναι τσεκαρισμενο ή οχι
  final String taskTitle; // στεγαζει το τιτλο της αγγραφης/todo  
  final Function checkboxCallback; // φερει τη λειτουργικοτητα του checkbox (δηλαδη οταν γινεται κλικ να αλλαζει status του isChecked)

  TaskTile(
      {required this.isChecked,
      required this.taskTitle,
      required this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: (a) => checkboxCallback(a) //(a) => toggleCheckboxState(a),
          ),
    );
  }
}

//Η checkboxCallback ΑΠΛΑ καλει τη προτυπη custom void function toggleDone μιας μεταβλητης που κληρονομουν οι μεταβλητες/instances Task
