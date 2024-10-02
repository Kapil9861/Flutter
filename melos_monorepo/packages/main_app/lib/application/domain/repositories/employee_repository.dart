import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';

abstract class EmployeeRepository {
  Future<int> addEmployee(Employee employee);
  Future<Employee> getEmployee(String employeeId);
  Future<bool> updateEmployee({
    required int id,
    String? designation,
    required String userId,
    int? salary,
  });
  Future<int> deleteEmployee(int employeeId);
  Future<List<Employee>> getEmployeeOnProject(String projectId);
  Stream<List<Employee>> getAllEmployees();
}
