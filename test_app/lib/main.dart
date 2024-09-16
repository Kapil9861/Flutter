// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:riverpod_tutorial/data/models/user.dart';
// import 'package:riverpod_tutorial/presentation/riverpod/pages/provider_class_values.dart';
// import 'package:riverpod_tutorial/presentation/riverpod/providers/user_notifier.dart';
// // import 'package:riverpod_tutorial/presentation/riverpod/pages/change_string_value.dart';
// // import 'package:riverpod_tutorial/presentation/riverpod/providers/provider.dart';

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (_) => UserNotifier(User(id: "0", username: "N/A")),
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     // final String? value = ref.watch(helloWorldProvider);
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const ProviderClassValues(),

//       // ChangeStringValue(
//       //     value: value,
//       //   )
//     );
//   }
// }
