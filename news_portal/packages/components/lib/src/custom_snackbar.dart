import 'package:flutter/material.dart';

class CustomSnackbar {
  void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(
          seconds: 3,
        ),
      ),
    );
  }
}
