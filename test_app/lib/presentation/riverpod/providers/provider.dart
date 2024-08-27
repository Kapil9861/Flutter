import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/data/models/student.dart';
import 'package:riverpod_tutorial/presentation/riverpod/providers/student_notifier.dart';

final helloWorldProvider = StateProvider<String?>((ref) {
  return null;
});

// The conditions are in StudentNotifier in class "StudentNotifier 1
// Condition 2
// final userProvider = StateNotifierProvider((ref) {
//   return StudentNotifier();
// });

// Condition 1
final userProvider = StateNotifierProvider<StudentNotifier, Student>((ref) {
  return StudentNotifier(Student(id: "0", username: "Not Available"));
});
