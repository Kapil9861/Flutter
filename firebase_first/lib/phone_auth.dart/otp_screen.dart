import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_first/auth/home.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.verificationid});
  final String verificationid;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
                if (value == null || value == "" || value.length < 6) {
                  return "Please enter valid OTP";
                } else {
                  return null;
                }
              },
              controller: controller,
              decoration: InputDecoration(
                hintText: "Enter OTP",
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
              try {
                PhoneAuthCredential credential =
                    await PhoneAuthProvider.credential(
                        verificationId: widget.verificationid,
                        smsCode: controller.text.toString());
                FirebaseAuth.instance
                    .signInWithCredential(credential)
                    .then((value) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Home();
                  }));
                });
              } on FirebaseAuthException catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(e.code)),
                );
              }
            },
            child: const Text("Verify OTP"),
          )
        ],
      ),
    );
  }
}
