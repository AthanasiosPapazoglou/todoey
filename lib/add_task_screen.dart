//Η newRecordSheet καλείται απο το Home Screen (tasks_screen) απο το onPressed action του FAB της
//Δομεί το UI του modalsheet που κανει pop up για να βάλουμε μια νεα εγγραφη/todo στη λιστα μας
//Δομεί επίσης και τη λειτουργικότητα καταγραφης τιμης του textfiled καθως και αποστολης της με το submit button
//Καλείται με argument ενα CBfunction το οποίο εκτελεί τη λειτουργικότητα τοποθετησης της τιμης του textField στη λιστα εγγραφων

import 'package:flutter/material.dart';
import 'package:todoey/tasks_screen.dart';

class newRecordSheet extends StatelessWidget {
  
  final Function addTaskCallback; //Η CBfunction που θα φερει τη λειτουργικοτητα τοποθετησης τιμης στη λιστα
                                  //CARE η λειτουργια της callback ΔΗΛΩΝΕΤΑΙ στη ΚΛΗΣΗ της πατρικής της function
                                  //ΒΛΕΠΕ task_screen στο codeblock του ModalSheet
  newRecordSheet(this.addTaskCallback);

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add ToDo',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30.0,
              ),
            ),
            TextField( //Το textField εχει χαρακτηρα input, όποτε εκτελείται keystroke στο πεδιο του αυτοματα το value του πεδιου ανανεωνεται
            //Η λειτουργια αυτη γινεται με χρηση CBfunction ως λειτουργια του onChanged property
            //ΠΑΝΤΑ η CBfunction στο property onChanged ενoς textField φερει ως argument το CURRENT VALUE του
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            FlatButton( //Το Button εκτελει τη λειτουργικοτητα καταθεσης της τιμης του textfield ως καινουργια εγγραφη στη λιστα todos
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                addTaskCallback(newTaskTitle); // <======= CALL POINT
              },
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
