import 'package:flutter/material.dart';
import 'package:marsenger_flavor/chat_test/chat_test_page.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  final flavor = packageInfo.packageName.contains("dev")
      ? "dev"
      : packageInfo.packageName.contains("prod")
          ? "prod"
          : "staging";
  runApp(MyApp(flavor: flavor));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.flavor});
  final String flavor;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChatTestPage(
        title: flavor,
      ),
    );
  }
}
