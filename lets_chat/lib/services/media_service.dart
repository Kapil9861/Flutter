import 'dart:io';

import 'package:image_picker/image_picker.dart';

class MediaService {
  final ImagePicker _picker = ImagePicker();

  Future<File?> getImageFromGallery() async {
    final XFile? file = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (file != null) {
      return File(file.path);
    }
    return null;
  }

  Future<File?> getVideoFromGallery() async {
    final XFile? file = await _picker.pickVideo(
      source: ImageSource.gallery,
    );
    if (file != null) {
      return File(file.path);
    }
    return null;
  }
}
