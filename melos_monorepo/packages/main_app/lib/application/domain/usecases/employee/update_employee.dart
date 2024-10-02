import 'package:main_app/application/domain/repositories/employee_repository.dart';

class UpdateEmployee {
  final EmployeeRepository repo;

  UpdateEmployee(this.repo);
  Future<bool> call({
    required int employeeId,
    required String userId,
    String? designation,
    int? salary,
  }) async {
    return await repo.updateEmployee(
      id: employeeId,
      userId: userId,
      designation: designation,
      salary: salary,
    );
  }
}
