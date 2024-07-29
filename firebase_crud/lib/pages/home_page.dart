import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud/models/todo.dart';
import 'package:firebase_crud/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DatabaseService _service = DatabaseService();
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _appBar(),
      body: buildUi(),
      floatingActionButton: FloatingActionButton(
        onPressed: _displayTextInputDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: const Text(
        "Todo",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget buildUi() {
    return SafeArea(
      child: Column(
        children: [_messagesListView()],
      ),
    );
  }

  Widget _messagesListView() {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.80,
      width: MediaQuery.sizeOf(context).width,
      child: StreamBuilder(
        builder: (context, snapshot) {
          List todos = snapshot.data?.docs ?? [];
          if (todos.isEmpty) {
            return const Center(child: Text("Add a TODO!"));
          }
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              Todo todo = todos[index].data();
              // Just to know how to access the id
              String todoId = todos[index].id;
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Dismissible(
                  key: Key(todoId),
                  onDismissed: (direction) {
                    _service.deleteTodo(todoId);
                  },
                  child: ListTile(
                    tileColor: Theme.of(context).colorScheme.primaryContainer,
                    title: Text(todo.task),
                    subtitle: Text(DateFormat('dd-MM-yyyy')
                        .format(todo.createdOn.toDate())),
                    trailing: Checkbox(
                      value: todo.isDone,
                      onChanged: (value) {
                        Todo updatedTodo = todo.copyWith(
                          isDone: !todo.isDone,
                          updatedOn: Timestamp.now(),
                        );
                        _service.updateTodo(todoId, updatedTodo);
                      },
                    ),
                  ),
                ),
              );
            },
          );
        },
        stream: _service.getTodos(),
      ),
    );
  }

  void _displayTextInputDialog() async {
    return showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text("Add a Todo!"),
          content: TextFormField(
            decoration: const InputDecoration(hintText: "Todo..."),
            controller: _controller,
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.red[900]),
              ),
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Todo newTodo = Todo(
                    task: _controller.text,
                    updatedOn: Timestamp.now(),
                    createdOn: Timestamp.now(),
                    isDone: false);
                _service.addTodo(newTodo);
                Navigator.of(context).pop();
                _controller.clear();
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.blue[400]),
              ),
              child: const Text(
                "Add Todo",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
