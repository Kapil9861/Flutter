import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:main_app/application/data/data_sources/projects_datasource.dart';
import 'package:main_app/application/data/repositories/project_repository_impl.dart';
import 'package:main_app/application/domain/repositories/project_repository.dart';
import 'package:main_app/application/domain/usecases/project/add_projects.dart';
import 'package:main_app/application/domain/usecases/project/delete_project.dart';
import 'package:main_app/application/domain/usecases/project/get_all_project.dart';
import 'package:main_app/application/domain/usecases/project/get_project.dart';
import 'package:main_app/application/domain/usecases/project/get_projects_for_employee.dart';
import 'package:main_app/application/domain/usecases/project/update_project.dart';
import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';

final projectDataSourceProvider = Provider<ProjectsDatasource>((ref) {
  return ProjectsDatasource();
});
// Provider for ProjectRepository
final projectRepositoryProvider = Provider<ProjectRepository>((ref) {
  return ProjectRepositoryImpl(ref.read(projectDataSourceProvider));
});

// Provider for GetProjectNotifier
final projectProvider =
    StateNotifierProvider<GetProjectNotifier, Project>((ref) {
  final repo = ref.read(projectRepositoryProvider);
  final getProject = GetProject(repo);
  return GetProjectNotifier(getProject);
});

final projectsProvider = StreamProvider<List<Project>>((ref) {
  final repo = ref.watch(projectRepositoryProvider);
  final project = GetAllProject(repo);
  return project.call();
});

final updateProjectProvider =
    StateNotifierProvider<UpdateProjectNotifier, bool>((ref) {
  final repo = ref.watch(projectRepositoryProvider);
  final update = UpdateProject(repo);
  return UpdateProjectNotifier(false, update);
});

class UpdateProjectNotifier extends StateNotifier<bool> {
  UpdateProjectNotifier(super.state, this.project);
  final UpdateProject project;
  Future<void> updateProject(BuildContext context,
      {required String projectName, String? newName, ProjectType? type}) async {
    final isUpdated = await project.call(
      projectName: projectName,
      newName: newName,
      type: type,
    );
    if (isUpdated) {
      CustomAnimatedSnackbar.show(
        "The Project is Updated!",
        context: context,
      );
    } else {
      CustomAnimatedSnackbar.show(
        "The Project Could Not be Updated!",
        context: context,
      );
    }
  }
}

final deleteProjectProvider = FutureProvider.family<int, String>((ref, id) {
  final repo = ref.watch(projectRepositoryProvider);
  final delete = DeleteProject(repo);

  return delete.call(id);
});

final addProjectProvider =
    StateNotifierProvider<AddProjectNotifier, int>((ref) {
  final repo = ref.watch(projectRepositoryProvider);
  final addProject = AddProjects(repo);
  return AddProjectNotifier(addProject);
});

final getProjectsForEmployeeProvider =
    StateNotifierProvider<GetProjectsForEmployeeNotifier, List<Project>>((ref) {
  final repo = ref.watch(projectRepositoryProvider);
  final projects = GetProjectsForEmployee(repo);
  return GetProjectsForEmployeeNotifier(projects);
});

class GetProjectsForEmployeeNotifier extends StateNotifier<List<Project>> {
  GetProjectsForEmployeeNotifier(this.projects) : super([]);
  final GetProjectsForEmployee projects;
  Future<void> getProjects(int employeeId, BuildContext context) async {
    try {
      final projectList = await projects.call(employeeId);
      state = projectList;
    } on Exception catch (e) {
      CustomAnimatedSnackbar.show(e.toString(), context: context);
    }
  }
}

class AddProjectNotifier extends StateNotifier<int> {
  AddProjectNotifier(this.addProjects) : super(0);
  final AddProjects addProjects;

  Future<void> addProject(
      ProjectsCompanion project, BuildContext context) async {
    final addProject = await addProjects.call(project);
    try {
      state = addProject;

      if (addProject > 0) {
        state = addProject;
        CustomAnimatedSnackbar.show(
          "Project Added Successfully!",
          context: context,
        );
        // state = 0;
      } else if (state < 0) {
        CustomAnimatedSnackbar.show(
          "Project Already Exists! Verify Project Name!",
          context: context,
        );
      } else {
        CustomAnimatedSnackbar.show(
          "State not found!",
          context: context,
        );
      }
    } on Exception catch (e) {
      CustomAnimatedSnackbar.show(
        "Error: ${e.toString()}",
        context: context,
      );
    }
  }
}

// GetProjectNotifier
class GetProjectNotifier extends StateNotifier<Project> {
  final GetProject getProject;

  GetProjectNotifier(this.getProject)
      : super(
          const Project(
            id: "initial-state",
            projectName: "INITIAL STATE",
            type: ProjectType.mobileApplication,
          ),
        );

  Future<void> fetchProject(BuildContext context, String projectName) async {
    try {
      final data = await getProject.call(projectName);
      state = data;
    } on Exception catch (e) {
      CustomAnimatedSnackbar.show(
        e.toString(),
        context: context,
      );
    }
  }
}
