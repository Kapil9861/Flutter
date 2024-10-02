import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:main_app/application/presentation/providers/employee_providers.dart';
import 'package:main_app/application/presentation/providers/small_providers.dart';
import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';

class AddEmployeeScreen extends ConsumerWidget {
  AddEmployeeScreen(this.userId, this.phoneNumber, {super.key});
  final designationController =
      TextEditingController(text: "Frontend Developer");
  final salaryController = TextEditingController(text: "10000");
  final designationFocusNode = FocusNode();
  final salaryFocusNode = FocusNode();
  final String userId;
  final String phoneNumber;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employeeData = ref.watch(getEmployeeProvider);
    final isVisible = ref.watch(updateVisibilityProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add User as Employee"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text("Current User:${employeeData.toString()}\n\n$userId"),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: employeeData.userId == "initial-state"
                ? Column(
                    children: [
                      CustomTextField(
                        controller: designationController,
                        valueName: "designation",
                        focusNode: designationFocusNode,
                      ),
                      CustomTextField(
                        controller: salaryController,
                        valueName: "salary",
                        focusNode: salaryFocusNode,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 28.0),
                        child: ElevatedButton(
                          onPressed: () {
                            int salary = int.parse(salaryController.text);
                            String designation = designationController.text;
                            if (salary > 999 &&
                                salary != null &&
                                designation.isNotEmpty) {
                              ref
                                  .read(addEmployeeProvider(
                                    Employee(
                                      userId: userId,
                                      id: 1,
                                      salary: salary,
                                      designation: designation,
                                    ),
                                  ).notifier)
                                  .add(context);
                              ref
                                  .read(getEmployeeProvider.notifier)
                                  .getEmployee(context, userId);
                            } else {
                              CustomAnimatedSnackbar.show("Invalid Input",
                                  context: context);
                            }
                          },
                          child: const Text("Add User as Employee"),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Visibility(
                        visible: isVisible,
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: designationController,
                              valueName: "designation",
                              focusNode: designationFocusNode,
                            ),
                            CustomTextField(
                              controller: salaryController,
                              valueName: "salary",
                              focusNode: salaryFocusNode,
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          ref.read(updateVisibilityProvider.notifier).state =
                              !isVisible;

                          if (isVisible) {
                            int salary = int.parse(salaryController.text);
                            String designation = designationController.text;
                            if (salary > 999 &&
                                salary != null &&
                                designation.isNotEmpty) {
                              ref.read(updateEmployeeProvider.notifier).update(
                                    userId,
                                    employeeData.id,
                                    context,
                                    designation: designation,
                                    salary: salary,
                                  );
                            } else {
                              CustomAnimatedSnackbar.show("Invalid Input",
                                  context: context);
                            }
                          }
                        },
                        child: const Text("Update Employee Data"),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
