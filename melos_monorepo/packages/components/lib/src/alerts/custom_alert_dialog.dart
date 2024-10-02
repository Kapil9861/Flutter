import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';

class CustomAlertDialog {
  static void show(
    BuildContext context, {
    required String title,
    required String body,
    required CustomDialogType dialogType,
    Color titleColor = Colors.black,
    Color bodyColor = Colors.black,
    required VoidCallback onCancelOnPressed,
    required VoidCallback onOkPressed,
  }) {
    DialogType convertedDialogType;
    if (dialogType == CustomDialogType.error) {
      convertedDialogType = DialogType.error;
    } else if (dialogType == CustomDialogType.info) {
      convertedDialogType = DialogType.info;
    } else if (dialogType == CustomDialogType.infoReverse) {
      convertedDialogType = DialogType.infoReverse;
    } else if (dialogType == CustomDialogType.noHeader) {
      convertedDialogType = DialogType.noHeader;
    } else if (dialogType == CustomDialogType.success) {
      convertedDialogType = DialogType.success;
    } else if (dialogType == CustomDialogType.warning) {
      convertedDialogType = DialogType.warning;
    } else {
      convertedDialogType = DialogType.info;
    }
    if (Platform.isIOS) {
      showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return CupertinoAlertDialog(
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                child: Text("OK"),
                onPressed: () {
                  onOkPressed();
                  Navigator.of(context).pop();
                },
              ),
              CupertinoDialogAction(
                child: Text("Cancel"),
                onPressed: () {
                  onCancelOnPressed();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      AwesomeDialog(
        context: context,
        dialogType: convertedDialogType,
        body: Center(
          child: StyledText(
            text: body,
            fontWeight: FontWeight.normal,
            textColor: titleColor,
            fontSize: 15,
          ),
        ),
        title: title,
        btnOkOnPress: () {
          onOkPressed();
        },
        btnCancelOnPress: () {
          onCancelOnPressed();
        },
      ).show();
    }
  }
}
