import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:lets_chat/models/users_profile.dart';
import 'package:lets_chat/services/auth_services.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference? _references;
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
}