import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lets_chat/models/users_profile.dart';

class DatabaseService {
 final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference? _references; 

  DatabaseService() {
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

  Future<void> createUserProfile({required UserProfile userProfile}) async{
    await _references?.doc(userProfile.uid).set(userProfile);
  }
}
