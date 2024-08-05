import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:lets_chat/firebase_options.dart';
import 'package:lets_chat/services/auth_services.dart';
import 'package:lets_chat/services/navigation_service.dart';

Future<void> firebaseSetup() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future<void> registerService() async {
  final GetIt getIt = GetIt.instance;
  getIt.registerSingleton<AuthService>(
    AuthService(),
  );
  getIt.registerSingleton<NavigationService>(
    NavigationService(),
  );
}
