import 'package:flavor/my_app.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final String flavor;
  const App({super.key, required this.flavor});

  @override
  Widget build(BuildContext context) {
    return MyApp(flavor: flavor);
  }
}
