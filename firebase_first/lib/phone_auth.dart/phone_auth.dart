import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_first/phone_auth.dart/otp_screen.dart';
import 'package:flutter/material.dart';

class PhoneAuthentication extends StatefulWidget {
  const PhoneAuthentication({super.key});

  @override
  State<PhoneAuthentication> createState() => _PhoneAuthenticationState();
}

class _PhoneAuthenticationState extends State<PhoneAuthentication> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phone Authentication"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              validator: (value) {
                if (value == null || value == "" || value.length < 10) {
                  return "Please enter valid phone number";
                } else {
                  return null;
                }
              },
              controller: controller,
              decoration: InputDecoration(
                hintText: "Enter Phone Number",
                suffixIcon: const Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.verifyPhoneNumber(
                verificationCompleted: (PhoneAuthCredential credential) {},
                verificationFailed: (FirebaseAuthException ex) {},
                codeSent: (String verificationid, int? resendtoken) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return OtpScreen(verificationid: verificationid);
                  }));
                },
                codeAutoRetrievalTimeout: (String verificationid) {},
                phoneNumber: controller.text.toString(),
              );
            },
            child: const Text("Verify Phone Number"),
          )
        ],
      ),
    );
  }
}
