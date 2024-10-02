import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:drift/drift.dart' as d;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:main_app/application/domain/entities/employee_with_user.dart';
import 'package:main_app/application/presentation/providers/employee_project_provider.dart';
import 'package:main_app/application/presentation/providers/employee_providers.dart';
import 'package:main_app/application/presentation/providers/project_providers.dart';
import 'package:main_app/application/presentation/providers/small_providers.dart';
import 'package:main_app/application/presentation/providers/user_providers.dart';
import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';
import 'package:uuid/uuid.dart';

class ProjectEmployeeScreen extends ConsumerStatefulWidget {
  const ProjectEmployeeScreen(this.phoneNumber, {super.key});
  final String phoneNumber;

  @override
  ConsumerState<ProjectEmployeeScreen> createState() =>
      _ProjectEmployeeScreenState();
}

class _ProjectEmployeeScreenState extends ConsumerState<ProjectEmployeeScreen> {
  final projectNameController = TextEditingController(text: "Marsenger");
  final projectFocusNode = FocusNode();
  final uuid = const Uuid();
  List<int> employeesId = [];
  List<int> employeeIds = [];

  final _database = MyDatabase();
  @override
  Widget build(BuildContext context) {
    final allProjects = ref.watch(projectsProvider);
    final selectedProject = ref.watch(projectsNameProvider);
    final getProjectDetail = ref.watch(projectProvider);
    ref
        .read(employeesOnProjectProvider.notifier)
        .getEmployees(getProjectDetail.id, context);
    final employeeOnProject = ref.watch(employeesOnProjectProvider);
    final getAllEmployees = ref.watch(getAllEmployeesProvider);
    final selectedUserDetail = ref.watch(userDetailProvider);
    // final employeeWithUser = ref.watch(userWithEmployeeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Projects And Employees Screen"),
      ),
      body: allProjects.mapOrNull(
        loading: (loading) => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        data: (data) {
          final List<Project> project = data.value;

          if (project.isEmpty) {
            return Center(
              child: _addProjects(
                "No Projects found!!\n\n\nAdd Projects Projects",
              ),
            );
          } else {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 20),
                      child: StyledText(
                        text: "Look For Available Projects:",
                        textColor: Colors.black,
                      ),
                    ),
                    Center(
                      child: DropdownButton<String>(
                        hint: StyledText(text: "Select Project"),
                        value: ref.watch(projectsNameProvider),
                        items: project.map<DropdownMenuItem<String>>(
                          (project) {
                            return DropdownMenuItem(
                              value: project.projectName,
                              child: Text(project.projectName),
                            );
                          },
                        ).toList(),
                        onChanged: (value) async {
                          ref.read(projectsNameProvider.notifier).state =
                              value!;
                          await ref
                              .read(projectProvider.notifier)
                              .fetchProject(context, value);
                          await ref
                              .read(employeesOnProjectProvider.notifier)
                              .getEmployees(
                                getProjectDetail.projectName,
                                context,
                              );
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Table(
                    border: TableBorder.all(),
                    columnWidths: const <int, TableColumnWidth>{
                      0: FlexColumnWidth(),
                      1: FlexColumnWidth(),
                      2: FlexColumnWidth(),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: <TableRow>[
                      TableRow(
                        children: [
                          Center(
                            child: StyledText(text: "Project Name:"),
                          ),
                          Center(
                            child: StyledText(text: "ProjectType"),
                          ),
                          Center(
                            child: StyledText(text: "Employees"),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Center(
                            child: Text(selectedProject ?? ""),
                          ),
                          Center(
                            child: Text(
                              getProjectDetail.type
                                  .toString()
                                  .split('.')
                                  .last
                                  .toUpperCase(),
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                          Center(
                            child: Column(
                                children: employeeOnProject.map(
                              (element) {
                                return FutureBuilder<EmployeeWithUser?>(
                                  future: _database
                                      .getEmployeeWithUserData(element.id),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      final employeeWithUser = snapshot.data;
                                      if (employeeWithUser != null) {
                                        return Text(
                                            "${employeeWithUser.userName}: ${employeeWithUser.employeeId}");
                                      } else {
                                        return const Text(
                                            "No employee added yet!");
                                      }
                                    } else if (snapshot.hasError) {
                                      return const Text("Error");
                                    } else {
                                      return const Text(
                                          "Something went worng!");
                                    }
                                  },
                                );
                              },
                            ).toList()
                                // FutureBuilder(
                                //   future:
                                //       _database.getEmployeesNameById(employeeIds),
                                //   builder: (context, snapshot) {
                                //     if (snapshot.hasData) {
                                //       final snapData = snapshot.data;
                                //       final namesList = snapData!["names"];
                                //       final employeeIds = snapData["e_id"];
                                //       if (namesList != null &&
                                //           namesList.isNotEmpty) {
                                //         return Column(
                                //           children: List.generate(
                                //               namesList.length, (index) {
                                //             return Dismissible(
                                //               key: employeeIds![index],
                                //               child: StyledText(
                                //                 text:
                                //                     "${namesList[index]} (${employeeIds[index]})",
                                //               ),
                                //               onDismissed: (d) {},
                                //             );
                                //           }),
                                //         );
                                //       } else {
                                //         return const Center(
                                //           child: Text("No employees yet!"),
                                //         );
                                //       }
                                //     } else {
                                //       return const Center(
                                //         child: Text("No employees yet!"),
                                //       );
                                //     }
                                //   },
                                // ),

                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                getAllEmployees.maybeWhen(
                  //=======
                  orElse: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  data: (data) {
                    employeesId = data.map((employee) => employee.id).toList();
                    ref
                        .read(userDetailProvider.notifier)
                        .getUser(widget.phoneNumber);

                    return Padding(
                      padding: const EdgeInsets.only(top: 28.0, bottom: 15),
                      child: Column(
                        children: [
                          selectUserForProject(data, selectedUserDetail.user,
                              employeesId, getProjectDetail),
                        ],
                      ),
                    );
                  },
                ),
                _addProjects("Add More Projects"),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _addProjects(String message) {
    final selectedProjectType = ref.watch(projectTypeProvider);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Center(
            child: StyledText(
              text: "Add Projects",
            ),
          ),
          CustomTextField(
            controller: projectNameController,
            valueName: "Project Name",
            focusNode: projectFocusNode,
          ),
          DropdownButton<ProjectType>(
            value: ref.watch(projectTypeProvider),
            items: ProjectType.values.map<DropdownMenuItem<ProjectType>>(
              (ProjectType projectType) {
                return DropdownMenuItem<ProjectType>(
                  value: projectType,
                  child: Text(
                    projectType.toString().split('.').last.toUpperCase(),
                  ),
                );
              },
            ).toList(),
            onChanged: (ProjectType? value) {
              ref.read(projectTypeProvider.notifier).state = value!;
            },
          ),
          ElevatedButton(
            onPressed: () async {
              if (projectNameController.text.isNotEmpty &&
                  projectNameController.text.length > 2) {
                String id = uuid.v1();
                final project = ProjectsCompanion(
                  id: d.Value(id),
                  projectName: d.Value(projectNameController.text),
                  type: d.Value(selectedProjectType),
                );
                ref.read(userDetailProvider.notifier).getUser("+92265368748");

                await ref
                    .read(addProjectProvider.notifier)
                    .addProject(project, context);
              } else if (projectNameController.text.length < 3) {
                CustomAlertDialog.show(
                  context,
                  title: "Error!",
                  body: "The project name must be more than 2 alphabets!",
                  dialogType: CustomDialogType.error,
                  onCancelOnPressed: () {},
                  onOkPressed: () {},
                );
              }
            },
            child: const Text("Add Projects"),
          )
        ],
      ),
    );
  }

  Widget selectUserForProject(List<Employee> data, selectedUserDetail,
      List<int> empIds, Project getProjectDetail) {
    return FutureBuilder(
      future: _database.getEmployeesNameById(empIds),
      builder: (context, snapshot) {
        if (snapshot.data != null && snapshot.hasData) {
          final map = snapshot.data;
          final namesList = map!['names'];
          final numbersList = map['numbers'];
          final usersId = map['users_id'];
          final length = numbersList!.length;
          return Column(
            children: [
              DropdownButton<int>(
                hint: StyledText(
                  text: (usersId != null && usersId.isEmpty)
                      ? "No Employees Found!"
                      : "Select User to be Added",
                ),
                value: ref.watch(usersDropdownNameProvider),
                items: List.generate(
                  length,
                  (index) {
                    return DropdownMenuItem<int>(
                      value: empIds[index],
                      child: StyledText(
                          text: "${namesList![index]} (${numbersList[index]})"),
                    );
                  },
                ),
                onChanged: (value) async {
                  ref.read(usersDropdownNameProvider.notifier).state = value!;
                  final userWithEmployee =
                      await _database.getEmployeeWithUserData(value);
                  if (userWithEmployee != null) {
                    ref.read(employeeFromDropdownProvider.notifier).state =
                        await _database.getEmployee(userWithEmployee.userId);
                  } else {
                    CustomAnimatedSnackbar.show("Did not found the user!",
                        context: context);
                  }
                },
              ),
              if (ref.watch(employeeFromDropdownProvider) == null)
                const Center(
                  child: CircularProgressIndicator(),
                ),
              if (ref.watch(employeeFromDropdownProvider) != null)
                ElevatedButton(
                  onPressed: () async {
                    final employeeFromDropdown =
                        ref.watch(employeeFromDropdownProvider);
                    CustomAlertDialog.show(
                      context,
                      title: "Are you sure?",
                      body:
                          "Adding employee with id:${employeeFromDropdown!.id} into ${getProjectDetail.projectName}",
                      dialogType: CustomDialogType.queation,
                      onCancelOnPressed: () {
                        ref
                            .read(
                              addEmployeeProvider(
                                Employee(
                                  userId: selectedUserDetail.user.id,
                                  id: 2,
                                  salary: 7500,
                                  designation: "Flutter Intern",
                                ),
                              ),
                            )
                            .add(context);
                      },
                      onOkPressed: () {
                        ref
                            .read(addEmployeeOnProjectProvider.notifier)
                            .addEmployeeOnProject(
                              context,
                              employeeFromDropdown.id,
                              getProjectDetail.id,
                            );
                      },
                    );
                  },
                  child: const Text("Add Employees On Project"),
                ),
            ],

            //
            ///
            ////
            ////Commented part is from here!
            ///
            //
          );
        } else {
          return const Text("No employees yet");
        }
      },
    );
  }
}
// List.generate(
//   namesList!.length,
//   (index) {
//     //Can display the data in the Column and can be used for the Dropdown button
//     // return Row(
//     //   mainAxisAlignment: MainAxisAlignment.center,
//     //   crossAxisAlignment: CrossAxisAlignment.center,
//     //   children: [
//     //     Text(namesList[index]),
//     //     Text("  (${numbersList![index]})")
//     //   ],
//     // );

//     if (numbersList != null) {
//       return Padding(
//         padding: const EdgeInsets.all(3),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//                 "numbers list:${numbersList.toString()} \n\n ${numbersList[index]}\n\n\n${ref.watch(usersDropdownNameProvider)}"),
//             // DropdownButton<String>(
//             //   value: ref.watch(usersDropdownNameProvider),
//             //   hint: const Text("Select Employee to Add"),
//             //   items: numbersList
//             //       .map<DropdownMenuItem<String>>((element) {
//             //     return DropdownMenuItem<String>(
//             //       value: numbersList[index],
//             //       child: StyledText(
//             //           text:
//             //               "${namesList[index]} (${numbersList[index]})"),
//             //     );
//             //   }).toList(),
//             //   onChanged: (value) {
//             //     ref.read(usersDropdownNameProvider.notifier).state =
//             //         value!;
//             //   },
//             // ),
//           ],
//         ),
//       );
//     } else {
//       return const Padding(
//         padding: EdgeInsets.all(5),
//         child: Text('No employees found!'),
//       );
//     }
//   },
// ),
