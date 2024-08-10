import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as paths;

class StorageService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  StorageService() {}
  Future<String?> uploadUserPfp({
    required File file,
    required String uid,
  }) async {
    Reference fileRef = _firebaseStorage.ref('users/pfps').child(
        '$uid${paths.extension(file.path)}'); //The ref will store the folder structure and the child stores the path that is to be added to the folder
    UploadTask task = fileRef.putFile(file);
    return task.then(
      //Once the file is uploaded the url link is provided for further use
      (p) {
        if (p.state == TaskState.success) {
          return fileRef.getDownloadURL();
        }
        return null;
      },
    );
  }

  Future<String?> uploadImageToChat(File file, String chatID) async {
    Reference imageRef = _firebaseStorage.ref('chats/$chatID').child(
        '${DateTime.now().toIso8601String}${paths.extension(file.path)}');
    UploadTask task = imageRef.putFile(file);
    return task.then((put) {
      if (put.state == TaskState.success) {
        return imageRef.getDownloadURL();
      }
      return null;
    });
  }
}
