import 'package:flutter_riverpod/flutter_riverpod.dart';

final genderProvider = StateProvider<String>((ref) {
  return "male";
});
