import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/presentation/riverpod/pages/change_class_values.dart';
// import 'package:riverpod_tutorial/presentation/riverpod/pages/change_string_value.dart';
// import 'package:riverpod_tutorial/presentation/riverpod/providers/provider.dart';

// void main() {
//   runApp(const ProviderScope(child: MyApp()));
// }

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    // final String? value = ref.watch(helloWorldProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ChangeClassValues(),

      // ChangeStringValue(
      //     value: value,
      //   )
    );
  }
}
