abstract class ProjectEmployeeRepository {
  Future<int> addEmployeeOnProject(int employeeId, String projectId);
  Future<int> deleteEmployeeonProject(int employeeId, String projectId);
}
