import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lets_chat/pages/login_page.dart';
import 'package:lets_chat/services/database.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? _user;

  User? get user {
    return _user;
  }

  AuthService() {}
  Future<bool> login(String email, String password) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        _user = credential.user;
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future signinWithGoogle(BuildContext context) async {
    final FirebaseAuth fireAuth = FirebaseAuth.instance;
    final GoogleSignIn signin = GoogleSignIn();
    final GoogleSignInAccount? googleAccount = await signin.signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    UserCredential result = await fireAuth.signInWithCredential(credential);
    User? userDetails = result.user;
    if (result != null) {
      Map<String, dynamic> userDetail = {
        'email': userDetails!.email,
        'name': userDetails.displayName,
        'imgUrl': userDetails.photoURL,
        'id': userDetails.uid,
        'phoneNumber': userDetails.phoneNumber,
      };
      await Database().addUser(userDetails.uid, userDetail).then((value) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const LoginPage()));
      });
    }
  }
}
