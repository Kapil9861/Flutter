import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:lets_chat/firebase_options.dart';
import 'package:lets_chat/services/alert_service.dart';
import 'package:lets_chat/services/auth_services.dart';
import 'package:lets_chat/services/database_service.dart';
import 'package:lets_chat/services/media_service.dart';
import 'package:lets_chat/services/navigation_service.dart';
import 'package:lets_chat/services/storage_service.dart';

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
  getIt.registerSingleton<AlertService>(
    AlertService(),
  );
  getIt.registerSingleton<MediaService>(
    MediaService(),
  );
  getIt.registerSingleton<StorageService>(
    StorageService(),
  );
  getIt.registerSingleton<DatabaseService>(
    DatabaseService(),
  );
}

String createChatId(String uid1, String uid2) {
  List uids = [uid1, uid2];
  uids.sort();
  String chatId = uids.fold("", (id, uid) => "$id.$uid");
  return chatId;
}
