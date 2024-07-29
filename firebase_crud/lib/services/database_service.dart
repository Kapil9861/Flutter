import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud/models/todo.dart';

const String TODO_COLLECION_REF = 'todos';

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;
  late final CollectionReference _todosRef;

  // Constructor for the database service
  DatabaseService() {
    _todosRef = _firestore
        .collection(TODO_COLLECION_REF)
        .withConverter<Todo> //mark the needed things to be the type of the Todo
            (
          fromFirestore: (snapshots, _) {
            final data = snapshots.data();
            if (data != null) {
              return Todo.fromJson(data);
            } else {
              throw Exception('Document does not exist');
            }
          }, //gets the data from the firestore
          toFirestore: (todo, _) => todo.toJson(),
        ); //The withconverter returns the collection reference to us in the form of schema that we have defined in the firestore
  }
// Get the data from the firestore
  Stream<QuerySnapshot> getTodos() {
    return _todosRef.snapshots();
  }

  // Add the data(TODO) to the firestore
  void addTodo(Todo todo) async {
    _todosRef.add(todo);
  }

  void updateTodo(String todoId, Todo todo) {
    _todosRef.doc(todoId).update(todo.toJson());
  }

  void deleteTodo(String todoId) {
    _todosRef.doc(todoId).delete();
  }
}
