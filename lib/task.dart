//Custom τυπος δεδομενων για τις μεμονομενες εγγραφες/Todos
//Καθε instance Task θα εχει 2 properties: τιτλο εγγραφης και κατασταση ολοκληρωσης (για το checkbox)
//επιπλεον θα εχει και ενα void function που οταν καλειται να κανει flip το boolean value της isDone

//ΠΡΟΣΟΧΗ ο τυπος δεδομενων Task ειναι αυτος που χρησιμοποιειται για αποθηκευση/διαχειριση και ΟΧΙ για απεικονιση
//ο απεικονιζομενος UI τυπος ειναι ListTiles και τα φτιάχνουμε ανατρέχοντας μια λιστα τυπου Task που χρησιμοποιουμε ως αποθηκευτικο χωρο 
//για ολα μας τα tasks

class Task {
  final String name;
  bool isDone;

  Task({required this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
