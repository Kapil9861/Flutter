import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/presentation/riverpod/providers/provider.dart';

class ChangeStringValue extends ConsumerWidget {
  const ChangeStringValue({super.key, this.value});
  final String? value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(helloWorldProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(value ?? "Old User"),
      ),
      body: GestureDetector(
        onTap: () {
          ref.read(helloWorldProvider.notifier).update((value) {
            return value == "New User" ? "Old User" : "New User";
          });
        },
        child: Center(
          child: Text(value ?? "null"),
        ),
      ),
    );
  }
}
