import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lets_chat/const.dart';
import 'package:lets_chat/services/media_service.dart';
import 'package:lets_chat/services/navigation_service.dart';
import 'package:lets_chat/widgets/custom_form.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GetIt _getIt = GetIt.instance;
  late NavigationService _navigationService;
  late MediaService _mediaService;
  bool? _hidePassword = false;

  String? name, email, password;
  File? selectedImage;

  @override
  void initState() {
    _navigationService = _getIt.get<NavigationService>();
    _mediaService = _getIt.get<MediaService>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 20,
        ),
        child: Column(
          children: [
            _headerText(context),
            _loginForm(),
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
            "Let's Get Going!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            "Register By Filling the Form Below!",
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
      height: MediaQuery.sizeOf(context).height * 0.60,
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.05,
      ),
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _profilePictureSelectionfield(),
            CustomForm(
              hint: "Name",
              height: MediaQuery.sizeOf(context).height * 0.08,
              customRegExp: NAME_VALIDATION_REGEX,
              onSave: (value) {
                name = value;
              },
            ),
            CustomForm(
              hint: "Email Address",
              height: MediaQuery.sizeOf(context).height * 0.08,
              customRegExp: EMAIL_VALIDATION_REGEX,
              onSave: (value) {
                email = value;
              },
            ),
            CustomForm(
              hint: "Password",
              height: MediaQuery.sizeOf(context).height * 0.08,
              customRegExp: PASSWORD_VALIDATION_REGEX,
              onSave: (value) {
                password = value;
              },
              obscureText: !_hidePassword!,
            ),
            Row(
              children: [
                Checkbox(
                  value: _hidePassword,
                  onChanged: (bool? value) {
                    setState(() {
                      _hidePassword = value;
                    });
                  },
                ),
                const Text(
                  "Show Password",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            _submitButton(),
            _linkText(),
          ],
        ),
      ),
    );
  }

  Widget _profilePictureSelectionfield() {
    return GestureDetector(
      onTap: () async {
        File? file = await _mediaService.getImageFromGallery();
        if (file != null) {
          setState(() {
            selectedImage = file;
          });
        }
      },
      child: CircleAvatar(
        radius: MediaQuery.of(context).size.width * 0.15,
        backgroundImage: selectedImage != null
            ? FileImage(selectedImage!)
            : NetworkImage(PLACEHOLDER_PFP),
      ),
    );
  }

  Widget _submitButton() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: MaterialButton(
        onPressed: () async {
          // if (_formKey.currentState?.validate() ?? false) {
          //   _formKey.currentState?.save();
          //   bool result = await _authService.login(email!, password!);
          //   if (result) {
          //     _navigationService.pushReplacementNamed("/home");
          //   } else {
          //     _alertService.showAlert(
          //       text:
          //           "Invalid Credentials! \n Are you sure you are registered?",
          //       textColor: Colors.red,
          //       icon: Icons.error,
          //       iconColor: Colors.red,
          //     );
          //   }
          // }
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

  Widget _linkText() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Already Have an Account?",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          TextButton(
            onPressed: () {
              _navigationService.pushNamed("/login");
            },
            child: const Text(
              "Log In",
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
