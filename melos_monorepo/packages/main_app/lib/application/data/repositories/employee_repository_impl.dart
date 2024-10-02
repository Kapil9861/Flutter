import 'package:main_app/application/data/data_sources/employee_datasource.dart';
import 'package:main_app/application/domain/repositories/employee_repository.dart';
import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  final EmployeeDatasource employeeDatasource;

  EmployeeRepositoryImpl(this.employeeDatasource);
  @override
  Future<int> addEmployee(Employee employee) async {
    return await employeeDatasource.addEmployee(employee);
  }

  @override
  Future<int> deleteEmployee(int employeeId) async {
    return await employeeDatasource.deleteEmployee(employeeId);
  }

  @override
  Future<Employee> getEmployee(String userId) async {
    return await employeeDatasource.getEmployee(userId);
  }

  @override
  Future<List<Employee>> getEmployeeOnProject(String projectId) async {
    return await employeeDatasource.getEmployeeOnProject(projectId);
  }

  @override
  Future<bool> updateEmployee(
      {required String userId,
      required int id,
      String? designation,
      int? salary}) async {
    return await employeeDatasource.updateEmployee(
        id: id, userId: userId, designation: designation, salary: salary);
  }

  @override
  Stream<List<Employee>> getAllEmployees() {
    return employeeDatasource.getAllEmployees();
  }
}
