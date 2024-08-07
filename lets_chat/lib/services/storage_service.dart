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
    Reference _fileRef = _firebaseStorage.ref('users/pfps').child(
        '$uid${paths.extension(file.path)}'); //The ref will store the folder structure and the child stores the path that is to be added to the folder
    UploadTask task = _fileRef.putFile(file);
    return task.then(
      //Once the file is uploaded the url link is provided for further use
      (p) {
        if (p.state == TaskState.success) {
          return _fileRef.getDownloadURL();
        }
      },
    );
  }
}
