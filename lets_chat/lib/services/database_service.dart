import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:lets_chat/models/chat.dart';
import 'package:lets_chat/models/messages.dart';
import 'package:lets_chat/models/users_profile.dart';
import 'package:lets_chat/services/auth_services.dart';
import 'package:lets_chat/utils.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference? _references;
  CollectionReference? _chatReference;
  late AuthService _authService;
  final GetIt _getIt = GetIt.instance;

  DatabaseService() {
    _authService = _getIt.get<AuthService>();
    _setupCollectionReferences();
  }
  void _setupCollectionReferences() async {
    _references = _firestore.collection("users").withConverter<UserProfile>(
        fromFirestore: (snapshot, _) {
      return UserProfile.fromJson(snapshot.data()!);
    }, toFirestore: (userProfile, _) {
      return userProfile.toJson();
    });
    _chatReference = _firestore.collection("chats").withConverter<Chat>(
      fromFirestore: (snapshots, _) {
        return Chat.fromJson(snapshots.data()!);
      },
      toFirestore: (chat, _) {
        return chat.toJson();
      },
    );
  }

  Future<void> createUserProfile({required UserProfile userProfile}) async {
    await _references?.doc(userProfile.uid).set(userProfile);
  }

  Stream<QuerySnapshot<UserProfile>> getUserProfiles() {
    return _references
        ?.where(
          "uid",
          isNotEqualTo: _authService.user!.uid,
        )
        .snapshots() as Stream<QuerySnapshot<UserProfile>>;
  }

  Future<bool> checkChatExists(String uid1, String uid2) async {
    String chatID = createChatId(uid1, uid2);
    final result = await _chatReference!.doc(chatID).get();
    if (result != null) {
      return result.exists;
    }
    return false;
  }

  Future<void> createNewChat(String uid1, String uid2) async {
    String chatID = createChatId(uid1, uid2);
    final docRef = _chatReference!.doc(chatID);
    final chat = Chat(
      id: chatID,
      participants: [uid1, uid2],
      messages: [],
    );
    await docRef.set(chat);
  }

  Future<void> sendChatMessage(
      String uid1, String uid2, Message message) async {
    String chatID = createChatId(uid1, uid2);
    final docRef = _chatReference!.doc(chatID);
    await docRef.update({
      "message": FieldValue.arrayUnion(
        [
          message.toJson(),
        ],
      )
    });
  }
}
