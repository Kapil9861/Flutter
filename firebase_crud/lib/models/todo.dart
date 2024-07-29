import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  Todo({
    required this.task,
    required this.updatedOn,
    required this.createdOn,
    required this.isDone,
  });
  String task;
  bool isDone;
  Timestamp createdOn;
  Timestamp updatedOn;

// Creating the factory method for the todo objects from the json maps that us received from the api i.e firebase or any other so that the application
// can use the todo objects and work on them in the app

  Todo.fromJson(Map<String, dynamic> json)
      : this(
          task: json['task'] as String,
          isDone: json['isDone'] as bool,
          createdOn: json['createdOn'] as Timestamp,
          updatedOn: json['updatedOn'] as Timestamp,
        );

  // This is a function that will copy our todo objects and provide us the same todo except now this can be modified
  Todo copyWith(
      {String? task,
      bool? isDone,
      Timestamp? createdOn,
      Timestamp? updatedOn}) {
    return Todo(
      task: task ?? this.task,
      isDone: isDone ?? this.isDone,
      createdOn: createdOn ?? this.createdOn,
      updatedOn: updatedOn ?? this.updatedOn,
    );
  }

  // finally a new function that  will just convert our maps of the todo objects to the json objects
  Map<String, Object> toJson() {
    return {
      'task': task,
      'isDone': isDone,
      'createdOn': createdOn,
      'updatedOn': updatedOn
    };
  }
}
