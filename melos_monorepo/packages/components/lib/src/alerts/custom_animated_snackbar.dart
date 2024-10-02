import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

class CustomAnimatedSnackbar {
  static void show(
    String message, {
    required BuildContext context,
    Color backgroundColor = Colors.white,
    Color textColor = Colors.black,
    AnimatedSnackBarType type = AnimatedSnackBarType.info,
  }) {
    AnimatedSnackBar.removeAll();
    AnimatedSnackBar(
      duration: Duration(seconds: 3),
      builder: ((context) {
        return MaterialAnimatedSnackBar(
          messageText: message,
          type: type,
          backgroundColor: backgroundColor,
          messageTextStyle: TextStyle(color: textColor),
        );
      }),
    ).show(context);
  }
}
