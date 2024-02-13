import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 98, 76, 101));
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        //Those that doesn't change change it manually
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.onPrimary,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.primaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer),
        ),
        textTheme: const TextTheme().copyWith(
          titleLarge: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            // this is not required as this will be overridden in the AppBar by its foreground Color
            //color: kColorScheme.primaryContainer,
          ),
          bodyMedium: TextStyle(color: kColorScheme.onPrimaryContainer),
        ),
        dialogTheme: const DialogTheme().copyWith(
          backgroundColor: kColorScheme.primaryContainer,
          //can't set foreground color so need to do it manually
          //or from the text theme
        ),
      ),
      home: const Expenses(),
    );
  }
}
