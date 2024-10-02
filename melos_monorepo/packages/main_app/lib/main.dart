import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:main_app/authentication/presentation/pages/login_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Melos Monorepo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledText(
          text: widget.title,
        ),
      ),
      body: Center(
        child: SizedBox(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  CustomAnimatedSnackbar.show(
                    "This is the message",
                    context: context,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    type: AnimatedSnackBarType.success,
                  );
                },
                child: const Text("CustomAnimatedSnackbar"),
              ),
              ElevatedButton(
                onPressed: () {
                  CustomAlertDialog.show(
                    context,
                    title: "Custom AlertDialog",
                    body: "The body is currently null.",
                    dialogType: CustomDialogType.error,
                    onCancelOnPressed: () {},
                    onOkPressed: () {},
                  );
                },
                child: const Text("AlertDialog"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const LoginPage();
                      },
                    ),
                  );
                },
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
