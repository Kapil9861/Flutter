import 'package:flavor/app.dart';
import 'package:flutter/material.dart';

void main() {
  const String flavor = String.fromEnvironment("FLAVOR", defaultValue: 'prod');
  runApp(
    const App(flavor: flavor),
  );
}
