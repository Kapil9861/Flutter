import 'package:flutter_riverpod/flutter_riverpod.dart';

final followButtonTextProvider = StateProvider<String>((ref) {
  return "Follow";
});

final selectedCategoryProvider = StateProvider<String>((ref) {
  return "";
});

final isLikedProvider = StateProvider((ref) {
  return false;
});
