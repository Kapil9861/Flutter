import 'package:flutter/material.dart';

class MyProvider extends StatefulWidget {
  const MyProvider({super.key});

  @override
  State<MyProvider> createState() => _MyProviderState();
}

class _MyProviderState extends State<MyProvider> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Provider Totorial"),
        ),
        body: Container(),
      ),
    );
  }
}
