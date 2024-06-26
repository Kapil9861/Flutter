import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';
// import 'package:flutter/services.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 86, 76, 101),
);
var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main() {
  //this is for locking the orientation but it is not needed right now
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then(
  //   (function) => runApp(const MyApp()),
  // );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        //appBarTheme: AppBarTheme(backgroundColor: kDarkColorScheme),
        colorScheme: kDarkColorScheme,
        cardTheme: CardTheme(
          color: kDarkColorScheme.primaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: kDarkColorScheme.onPrimaryContainer),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.primaryContainer),
        ),
      ),
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
          titleLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: kColorScheme.onPrimaryContainer, //for manual and import use
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: kColorScheme.onPrimaryContainer, //for manual and import use
          ),
          bodyMedium: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.normal,
            color: kColorScheme.onPrimaryContainer,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            // this is not required as this will be overridden in the AppBar by its foreground Color
            color: kColorScheme.onPrimaryContainer,
          ),
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
