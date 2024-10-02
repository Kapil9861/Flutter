import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:main_app/application/presentation/pages/know_your_customer/parents_info.dart';
import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';
import 'package:main_app/authentication/presentation/provider/kyc_notifier.dart';

class PersonalDetail extends ConsumerWidget {
  const PersonalDetail(this.phoneNumber, {super.key});
  final String phoneNumber;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String firstName, lastName, middleName;
    final dateFormat = DateFormat("yyyy-MM-dd");
    final firstNameController = TextEditingController(text: "Nabin");
    final middleNameController = TextEditingController(text: "Nabin");
    final lastNameController = TextEditingController(text: "Nabin");
    final dateController = TextEditingController();
    FocusNode firstNameNode = FocusNode();
    FocusNode middleNameNode = FocusNode();
    FocusNode lastNameNode = FocusNode();
    FocusNode dateFocusNode = FocusNode();
    List<String> genderValue = ["male", "female", "others"];
    DateTime? selectedDate;
    String dropDownButtonValue = ref.watch(dropDownProvider);

    final dateHint =
        " ${dateFormat.format(DateTime.now())} (Follow this format)";

    return Scaffold(
      appBar: AppBar(
        title: StyledText(text: "Know Your Customer: Personal Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                controller: firstNameController,
                valueName: "firstname",
                focusNode: firstNameNode,
              ),
              CustomTextField(
                controller: middleNameController,
                valueName: "middleName",
                focusNode: middleNameNode,
              ),
              CustomTextField(
                controller: lastNameController,
                valueName: "lastname",
                focusNode: lastNameNode,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 18.0,
                  bottom: 20,
                ),
                child: Row(
                  children: [
                    StyledText(text: "Gender:"),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 4, 33, 97)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: DropdownButton(
                            dropdownColor: Colors.green,
                            value: dropDownButtonValue,
                            items: genderValue.map<DropdownMenuItem<String>>(
                              (String value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: StyledText(
                                    text: value.toUpperCase(),
                                  ),
                                );
                              },
                            ).toList(),
                            onChanged: (String? value) {
                              ref.read(dropDownProvider.notifier).state =
                                  value!;
                              print("$dropDownButtonValue: value is $value");
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: dateHint,
                      controller: dateController,
                      valueName: "date-of-birth",
                      focusNode: dateFocusNode,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      selectedDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1900, 10),
                        lastDate: DateTime.now().subtract(
                          const Duration(days: 7),
                        ),
                      );
                      if (selectedDate != null) {
                        final convertedDate = dateFormat.format(
                          selectedDate!,
                        );
                        dateController.text = convertedDate;
                      }
                    },
                    icon: const Icon(
                      Icons.calendar_month,
                      color: Color.fromARGB(255, 162, 69, 69),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (selectedDate == null) {
                      dateFocusNode.requestFocus();
                      CustomAnimatedSnackbar.show(
                        "Please fill your date of birth field!",
                        context: context,
                        type: AnimatedSnackBarType.warning,
                        backgroundColor: Colors.orange,
                      );
                    } else {
                      firstName = firstNameController.text;
                      lastName = lastNameController.text;
                      middleName = middleNameController.text;
                      final genderDropDownValue =
                          ref.read(dropDownProvider.notifier).state;
                      print(genderDropDownValue);

                      await ref
                          .read(addPersonalInfoProvider.notifier)
                          .addPersonalRecords(
                            KnowYourCustomerData(
                              // id: 1,
                              phoneNumber: phoneNumber,
                              firstName: firstName,
                              lastName: lastName,
                              dateOfBirth: selectedDate!,
                              gender: genderDropDownValue,
                            ),
                          );

                      if (context.mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ParentsInfo(phoneNumber);
                            },
                          ),
                        );
                      }
                    }
                  },
                  child: const Text("Save"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
