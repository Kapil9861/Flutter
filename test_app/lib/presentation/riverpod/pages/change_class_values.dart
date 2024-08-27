import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/presentation/riverpod/providers/provider.dart';

class ChangeClassValues extends StatefulWidget {
  const ChangeClassValues({super.key});

  @override
  State<ChangeClassValues> createState() => _ChangeClassValuesState();
}

class _ChangeClassValuesState extends State<ChangeClassValues> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();

  void onNameSubmit(WidgetRef ref, String value) {
    ref.read(studentProvider.notifier).updateName(value);
  }

  void onIdSubmit(WidgetRef ref, String value) {
    ref.read(studentProvider.notifier).updateId(value);
  }

  void onStudentSubmit(WidgetRef ref, String name, String id) {
    ref.read(studentProvider.notifier).updateStudent(name, id);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, build) {
      final student = ref.watch(studentProvider);
      return Scaffold(
        appBar: AppBar(
          title: Text(student.username),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextField(
                controller: _idController,
                decoration: const InputDecoration(hintText: "ID"),
                onSubmitted: (value) {
                  onIdSubmit(ref, value);
                },
              ),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(hintText: "Name"),
                onSubmitted: (value) {
                  onNameSubmit(ref, value);
                },
              ),
              ElevatedButton(
                onPressed: () {
                  String name = _nameController.text;
                  String id = _idController.text;
                  onStudentSubmit(ref, name, id);
                },
                child: const Text("Submit Student"),
              ),
              Center(
                child: Text(student.toString()),
              ),
            ],
          ),
        ),
      );
    });
  }
}
