import 'package:firebase_core/firebase_core.dart';
import 'package:lets_chat/firebase_options.dart';

Future<void> firebaseSetup() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
