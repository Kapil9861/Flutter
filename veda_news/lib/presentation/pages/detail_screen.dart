import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 2.0, left: 2),
            child: Image.asset(width: 19, height: 20, "assets/icons/share.png"),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 10.5, top: 3),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }
}
