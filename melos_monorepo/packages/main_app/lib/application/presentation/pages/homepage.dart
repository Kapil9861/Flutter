import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:intl/intl.dart';
import 'package:main_app/application/presentation/pages/know_your_customer/personal_detail.dart';
import 'package:main_app/application/presentation/pages/office/add_employee_screen.dart';
import 'package:main_app/application/presentation/pages/office/project_employee_screen.dart';
import 'package:main_app/application/presentation/providers/employee_providers.dart';
import 'package:main_app/application/presentation/providers/small_providers.dart';
import 'package:main_app/application/presentation/providers/user_providers.dart';
import 'package:main_app/authentication/data/datasources/kyc_datasource.dart';
import 'package:main_app/authentication/data/drift_database/databases/my_database.dart';
import 'package:main_app/authentication/data/models/login_data_model.dart';
import 'package:main_app/authentication/domain/use_cases/delete_kyc.dart';
import 'package:main_app/authentication/presentation/provider/kyc_notifier.dart';
import 'package:main_app/authentication/presentation/provider/login_provider.dart';
import 'package:main_app/authentication/presentation/provider/stream_providers_kyc.dart';
import 'package:unicode_emojis/unicode_emojis.dart';
import 'package:uuid/uuid.dart';
import '../../../authentication/domain/use_cases/get_kyc_info.dart';

class Homepage extends ConsumerStatefulWidget {
  const Homepage({super.key});

  @override
  ConsumerState<Homepage> createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage> {
  final source = KycDatasource();
  final unicode = UnicodeEmojis();
  final getKycData = GetKycInfo();
  final deleteKyc = DeleteKyc();
  final uuid = const Uuid();
  final dobController = TextEditingController();
  final nameFocusNode = FocusNode();
  final dobFocusNode = FocusNode();
  Genders selectedGender = Genders.male;
  DateTime? selectedDate;
  DateFormat dateFormat = DateFormat('yyyy/MM/dd');

  LoginData get userState => ref.watch(loginProvider);
  get kycInfo => ref.watch(getKycInfoProvider);

  String get phoneNumber => userState.user!.phoneNumber ?? "+986565443433";
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(getKycInfoProvider.notifier).getInfo(phoneNumber, context);
      },
    );
    // oneTime(ref);

    super.initState();
  }

  Future<User> oneTime(WidgetRef ref) async {
    final iid = uuid.v1();
    await ref.read(addUserProvider.notifier).add(
          context,
          User(
            id: iid,
            name: "Another User",
            gender: Genders.female,
            phoneNumber: "+92265368748",
            dateOfBirth: "2060-10-10",
          ),
        );
    ref.read(userDetailProvider.notifier).getUser("+92265368748");
    ref
        .read(
          addEmployeeProvider(
            Employee(
                userId: iid,
                id: 2,
                salary: 7500,
                designation: "Flutter Intern"),
          ),
        )
        .add(context);
    return ref.read(userDetailProvider.notifier).user;
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final nameController =
        TextEditingController(text: userState.user!.fullname ?? "Empty");

    final checkKycVerified = ref.watch(checkKycCompletionProvider);
// final l = ref.watch(loginProvider);;
    ref.read(checkKycCompletionProvider).checkKycCompletion(phoneNumber);
    // _greeting(userState, context);
    final kycInfo = ref.watch(existingDataProvider(phoneNumber));
    ref.read(userDetailProvider.notifier).getUser(phoneNumber);

    final userData = ref.watch(userDetailProvider);

    String id = uuid.v1();
    return Scaffold(
      appBar: AppBar(
        title: StyledText(
          text: userState.user!.fullname ??
              "Username  Not Found there is some error!",
        ),
        actions: [
          if (checkKycVerified.result == true)
            TextButton.icon(
              onPressed: () async {
                await deleteKyc.delete(phoneNumber, context);
              },
              label: const Text("Remove KYC"),
              icon: const Icon(Icons.remove),
            ),
          CircleAvatar(
            child: Image.network(
              // userState.user!.profiles.profilePic ??
              "https://icon-library.com/images/icon-user/icon-user-15.jpg",
            ),
          )
        ],
      ),
      body: Column(
        children: [
          kycInfo.maybeWhen(
            orElse: () {
              return const CircularProgressIndicator();
            },
            data: (data) {
              if (data.isNotEmpty) {
                return Text(data.first.toString());
              } else {
                return const Text("KYC not updated yet!");
              }
            },
          ),
          const SizedBox(
            height: 30,
          ),
          const SizedBox(
            height: 30,
          ),
          userData.user.id == "initial-state"
              ? Center(
                  child: ElevatedButton(
                    onPressed: () {
                      ref.read(addUserProvider.notifier).add(
                            context,
                            User(
                              id: id,
                              name: userState.user!.fullname ?? "CustomName",
                              gender: Genders.male,
                              phoneNumber: phoneNumber,
                            ),
                          );
                      ref
                          .read(userDetailProvider.notifier)
                          .getUser(phoneNumber);
                    },
                    child: const Text("Enter as User"),
                  ),
                )
              : Expanded(
                  child: Column(
                    children: [
                      Text(userData.user.name),
                      Text(
                        userData.user.phoneNumber,
                      ),
                      Text(
                        userData.user.toString(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Center(
                              child: Text("Update User"),
                            ),
                            CustomTextField(
                              controller: nameController,
                              valueName: "name",
                              focusNode: nameFocusNode,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    controller: dobController,
                                    valueName: "date-of-birth",
                                    focusNode: dobFocusNode,
                                  ),
                                ),
                                Expanded(
                                  child: IconButton(
                                    onPressed: () async {
                                      selectedDate = await showDatePicker(
                                        context: context,
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime.now()
                                            .subtract(const Duration(days: 10)),
                                        initialDate: DateTime.now().subtract(
                                          const Duration(days: 10),
                                        ),
                                      );
                                      if (selectedDate != null) {
                                        dobController.text =
                                            dateFormat.format(selectedDate!);
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.calendar_month_rounded,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                StyledText(text: "Gender:"),
                                Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 4, 33, 97)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15),
                                      child: DropdownButton<String>(
                                        dropdownColor: Colors.green,
                                        value: ref.watch(userGenderProvider),
                                        items: Genders.values
                                            .map<DropdownMenuItem<String>>(
                                          (Genders value) {
                                            return DropdownMenuItem(
                                              value: value
                                                  .toString()
                                                  .split('.')
                                                  .last,
                                              child: StyledText(
                                                text: value
                                                    .toString()
                                                    .split('.')
                                                    .last
                                                    .toUpperCase(),
                                              ),
                                            );
                                          },
                                        ).toList(),
                                        onChanged: (String? value) {
                                          ref
                                              .read(userGenderProvider.notifier)
                                              .state = value!;
                                          if (value == "female") {
                                            selectedGender = Genders.female;
                                          } else if (value == "male") {
                                            selectedGender = Genders.male;
                                          } else {
                                            selectedGender = Genders.others;
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25.0),
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (nameController.text == "") {
                                      CustomAnimatedSnackbar.show(
                                          "Username cannot be empty of null",
                                          context: context);
                                    } else {
                                      await ref
                                          .read(updateUserProvider.notifier)
                                          .updateUser(
                                            context,
                                            phoneNumber: phoneNumber,
                                            gender: selectedGender,
                                            dob: dobController.text,
                                            name: nameController.text,
                                          );
                                    }
                                  },
                                  child: const Text("Update Data"),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25.0),
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return AddEmployeeScreen(
                                            userData.user.id,
                                            phoneNumber,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: const Text("Add As Employee"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return ProjectEmployeeScreen(phoneNumber);
                      },
                    ),
                  );
                },
                child: const Text("Manage Employee and Project"),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: checkKycVerified.result == false
          ? FloatingActionButton(
              child: const Icon(Icons.person),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return PersonalDetail(phoneNumber);
                    },
                  ),
                );
              },
            )
          : null,
    );
  }
}
