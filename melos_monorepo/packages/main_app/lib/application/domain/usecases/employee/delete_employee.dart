import 'package:main_app/application/domain/repositories/employee_repository.dart';

class DeleteEmployee {
  final EmployeeRepository repo;

  DeleteEmployee(this.repo);

  Future<String> deleteEmployee(int employeeId) async {
    final id = await repo.deleteEmployee(employeeId);
    if (id > 0) {
      return "Employee deleted successfully!";
    } else {
      return "Could not delete employee!";
    }
  }
}
