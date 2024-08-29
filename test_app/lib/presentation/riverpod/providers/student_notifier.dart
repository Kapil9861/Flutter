import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/data/models/student.dart';

class StudentNotifier extends StateNotifier<Student> {
  // Condition 1
  StudentNotifier(super.state);

  // Condition 2
  // StudentNotifier()
  //     : super(
  //         Student(id: "0", username: "username"),
  //       ) {
  //   updateName("Not Available!");
  // }

  // Condition 3
  // StudentNotifier()
  //     : super(
  //         Student(id: "0", username: "Not Available"),
  //       );

  void updateName(String name) {
    state = state.copyWith(username: name);
  }

  void updateId(String id) {
    state = state.copyWith(id: id);
  }

  void updateStudent(String name, String id) {
    state = state.copyWith(
      username: name,
      id: id,
    );
  }
}
