import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

final kDarkColorScheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  useMaterial3: true,
  textTheme: GoogleFonts.latoTextTheme(),
);
final kLightColorScheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MEALS',
      home: Text("Meals!"),
    );
  }
}
