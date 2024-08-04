import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lets_chat/const.dart';
import 'package:lets_chat/services/auth_services.dart';
import 'package:lets_chat/widgets/custom_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GetIt _getIt = GetIt.instance;
  late AuthService _authService;
  String? email, password;
  bool? hidePassword = false;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    _authService = _getIt.get<AuthService>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: Column(
          children: [
            _headerText(context),
            _loginForm(),
            _createButtomLink(),
          ],
        ),
      ),
    );
  }

  Widget _headerText(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Hi, Welcome Back!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            "Login to connect with your loved ones!",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginForm() {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.40,
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.08,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 48.0),
              child: CustomForm(
                customRegExp: EMAIL_VALIDATION_REGEX,
                hint: "Email",
                height: MediaQuery.sizeOf(context).height * 0.08,
                onSave: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
            ),
            CustomForm(
              onSave: (value) {
                setState(() {
                  password = value;
                });
              },
              obscureText: !hidePassword!,
              customRegExp: PASSWORD_VALIDATION_REGEX,
              hint: "Password",
              height: MediaQuery.sizeOf(context).height * 0.08,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: hidePassword,
                    onChanged: (bool? value) {
                      setState(() {
                        hidePassword = value;
                      });
                    },
                  ),
                  const Text("Show Password"),
                ],
              ),
            ),
            _loginButton(),
          ],
        ),
      ),
    );
  }

  Widget _loginButton() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: MaterialButton(
        onPressed: () async {
          if (_formKey.currentState?.validate() ?? false) {
            _formKey.currentState?.save();
            bool result = await _authService.login(email!, password!);
            print(result);
            if (result) {
            } else {}
          }
        },
        color: const Color.fromARGB(255, 3, 132, 238),
        child: const Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _createButtomLink() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Don't Have an Account?",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
