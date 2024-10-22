import 'package:flutter/material.dart';

class ChatTestPage extends StatefulWidget {
  const ChatTestPage({super.key, required this.title});
  final String title;

  @override
  State<ChatTestPage> createState() => _ChatTestPageState();
}

class _ChatTestPageState extends State<ChatTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const SizedBox(
        child: Text("data"),
      ),
    );
  }
}
