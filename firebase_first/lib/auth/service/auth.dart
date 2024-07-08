import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_first/auth/home.dart';
import 'package:firebase_first/auth/service/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async {
    return auth.currentUser;
  }

  Future signinWithGoogle(BuildContext context) async {
    final FirebaseAuth fireAuth = FirebaseAuth.instance;
    final GoogleSignIn signin = GoogleSignIn();
    final GoogleSignInAccount? googleAccount = await signin.signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleAccount!.authentication;
    final AuthCredential credential = await GoogleAuthProvider.credential(
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
            .push(MaterialPageRoute(builder: (context) => const Home()));
      });
    }
  }

  Future<User?> signInWithApple(BuildContext context,
      {List<Scope> scopes = const []}) async {
    final result = await TheAppleSignIn.performRequests(
        [AppleIdRequest(requestedScopes: scopes)]);
    switch (result.status) {
      case AuthorizationStatus.authorized:
        final AppleIdCredential = result.credential!;
        final OAuthCredential = OAuthProvider('apple.com');
        final credential = OAuthCredential.credential(
            idToken: String.fromCharCodes(AppleIdCredential.identityToken!));
        final UserCredential = await auth.signInWithCredential(credential);
        User? firebaseUser = UserCredential.user;
        if (scopes.contains(Scope.fullName)) {
          final fullName = AppleIdCredential.fullName;
          if (fullName != null &&
              fullName.givenName != null &&
              fullName.familyName != null) {
            final displayName = '${fullName.givenName}${fullName.familyName}';
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const Home()),
            );
            await firebaseUser!.updateDisplayName(displayName);
          }
        }
        return firebaseUser;
      case AuthorizationStatus.error:
        throw PlatformException(
            code: 'ERROR_AUTHORIZATION_DENIED',
            message: result.error.toString());
      case AuthorizationStatus.cancelled:
        throw PlatformException(
            code: 'ERROR_ABORTED_BY_USER',
            message: 'Sign in is aborted by the user.');
      default:
        throw UnimplementedError();
    }
  }
}
