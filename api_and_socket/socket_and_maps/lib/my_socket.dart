import 'package:flutter/material.dart';

class MySocket extends StatefulWidget {
  const MySocket({super.key});

  @override
  State<MySocket> createState() => _MySocketState();
}

class _MySocketState extends State<MySocket> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Socket Implementation"),
        ),
        body: Container(),
      ),
    );
  }
}
