import 'package:drift/drift.dart';
import './employees.dart';
import './projects.dart';

class EmployeesProjects extends Table {
  @override
  String get tableName => "employees_projects";
  IntColumn get employeeId =>
      integer().customConstraint("REFERENCES employees(id) NOT NULL")();
  TextColumn get projectId =>
      text().customConstraint("REFERENCES projects(id) NOT NULL")();

  @override
  Set<Column> get primaryKey => {projectId, employeeId};
}
