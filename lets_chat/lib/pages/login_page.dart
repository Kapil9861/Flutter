import 'package:flutter/material.dart';
import 'package:lets_chat/widgets/custom_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
      child: Column(
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomForm(
            hint: "Email",
            height: MediaQuery.sizeOf(context).height * 0.08,
          ),
          CustomForm(
            hint: "Password",
            height: MediaQuery.sizeOf(context).height * 0.08,
          ),
          _loginButton(),
        ],
      ),
    );
  }

  Widget _loginButton() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: MaterialButton(
        onPressed: () {},
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
