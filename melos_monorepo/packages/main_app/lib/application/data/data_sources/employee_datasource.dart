import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';

class EmployeeDatasource {
  final MyDatabase _database = MyDatabase();
  Future<int> addEmployee(Employee employee) async {
    return await _database.addEmployee(employee);
  }

  Future<Employee> getEmployee(String userId) async {
    return await _database.getEmployee(userId);
  }

  Future<bool> updateEmployee({
    required int id,
    required String userId,
    String? designation,
    int? salary,
  }) async {
    return await _database.updateEmployee(
      id: id,
      userId: userId,
      designation: designation,
      salary: salary,
    );
  }

  Future<int> deleteEmployee(int employeeId) async {
    return await _database.deleteEmployee(employeeId);
  }

  Future<List<Employee>> getEmployeeOnProject(String projectId) async {
    return await _database.getEmployeeOnProject(projectId);
  }

  Stream<List<Employee>> getAllEmployees() {
    return _database.getAllEmployees();
  }
}
