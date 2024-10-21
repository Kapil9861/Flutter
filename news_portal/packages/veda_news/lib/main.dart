import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veda_news/presentation/pages/login/login.dart';
import 'package:veda_news/presentation/pages/sliver_appbar.dart';

// Entry point of the application
void main() {
  const String flavor = String.fromEnvironment('FLAVOR');
  if (flavor == 'feature') {
    runApp(
      const ProviderScope(
        child: MyAppFeature(),
      ),
    );
  } else {
    runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );
  }
}

/// [MyAppFeature] is the root widget of the application.
/// It sets up the main configuration for the app, including the theme,
/// title, and initial route.
class MyAppFeature extends StatelessWidget {
  /// Constructs a [MyAppFeature] widget.
  const MyAppFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Veda News Portal', // Sets the title of the application.
      theme: ThemeData(
        // Configures the app's color scheme based on a seed color.
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 0, 60, 255),
        ),
        // Uses Material 3 design specifications.
        useMaterial3: true,
        // Applies the appBarTheme from the current theme context.
        appBarTheme: Theme.of(context).appBarTheme,
      ),
      debugShowCheckedModeBanner: false, // Hides the debug banner in the app.
      home: const LoginPage(), // Sets the home page of the app to `HomePage`.
    );
  }
}

/// [MyApp] is the root widget of the application.
/// It sets up the main configuration for the app, including the theme,
/// title, and initial route.
class MyApp extends StatelessWidget {
  /// Constructs a [MyApp] widget.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Veda News Portal', // Sets the title of the application.
      theme: ThemeData(
        // Configures the app's color scheme based on a seed color.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // Uses Material 3 design specifications.
        useMaterial3: true,
        // Applies the appBarTheme from the current theme context.
        appBarTheme: Theme.of(context).appBarTheme,
      ),
      debugShowCheckedModeBanner: false, // Hides the debug banner in the app.
      home: const LoginPage(), // Sets the home page of the app to `HomePage`.
    );
  }
}
