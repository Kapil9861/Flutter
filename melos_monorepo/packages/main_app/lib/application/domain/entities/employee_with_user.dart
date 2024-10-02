import 'package:core/core.dart';

class EmployeeWithUser {
  final int employeeId;
  final String userId;
  final bool? isActive;
  final int salary;
  final String designation;
  final String userName;
  final String? dateOfBirth;
  final Genders gender;
  final String phoneNumber;

  EmployeeWithUser({
    required this.employeeId,
    required this.userId,
    this.isActive,
    required this.salary,
    required this.designation,
    required this.userName,
    this.dateOfBirth,
    required this.gender,
    required this.phoneNumber,
  });
}
