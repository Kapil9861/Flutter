import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/models/expense.dart';

const String expense_COLLECION_REF = 'expenses';

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;
  late final CollectionReference _expensesRef;

  // Constructor for the database service
  DatabaseService() {
    _expensesRef = _firestore
        .collection(expense_COLLECION_REF)
        .withConverter<Expense> //mark the needed things to be the type of the expense
            (
          fromFirestore: (snapshots, _) {
            final data = snapshots.data();
            if (data != null) {
              return Expense.fromFirebase(data);
            } else {
              throw Exception('Document does not exist');
            }
          }, //gets the data from the firestore
          toFirestore: (expense, _) => expense.toFirebase(),
        ); //The withconverter returns the collection reference to us in the form of schema that we have defined in the firestore
  }
// Get the data from the firestore
  Stream<QuerySnapshot> getexpenses() {
    return _expensesRef.snapshots();
  }

  // Add the data(expense) to the firestore
  void addexpense(Expense expense) async {
    _expensesRef.add(expense);
  }

  void updateexpense(String expenseId, Expense expense) {
    _expensesRef.doc(expenseId).update(expense.toFirebase());
  }

  void deleteexpense(String expenseId) {
    _expensesRef.doc(expenseId).delete();
  }
}
