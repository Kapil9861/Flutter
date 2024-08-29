import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/presentation/riverpod/providers/user_notifier.dart';

class ProviderClassValues extends StatefulWidget {
  const ProviderClassValues({super.key});

  @override
  State<ProviderClassValues> createState() => _ProviderClassValuesState();
}

class _ProviderClassValuesState extends State<ProviderClassValues> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserNotifier>().user;

    return Scaffold(
      appBar: AppBar(
        title: Text(user.username),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: _idController,
              decoration: const InputDecoration(hintText: "ID"),
              onSubmitted: (value) {
                context.read<UserNotifier>().updateId(value);
              },
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: "Name"),
              onSubmitted: (value) {
                context.read<UserNotifier>().updateName(_nameController.text);
              },
            ),
            ElevatedButton(
              onPressed: () {
                String name = _nameController.text;
                String id = _idController.text;
                context.read<UserNotifier>().updateUser(name, id);
              },
              child: const Text("Submit User"),
            ),
            Center(
              child: Text(user.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
