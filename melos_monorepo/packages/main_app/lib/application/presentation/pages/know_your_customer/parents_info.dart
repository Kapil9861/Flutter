import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:main_app/application/presentation/pages/homepage.dart';
import 'package:main_app/authentication/presentation/provider/kyc_notifier.dart';
import 'package:main_app/authentication/presentation/provider/stream_providers_kyc.dart';

class ParentsInfo extends ConsumerWidget {
  const ParentsInfo(this.phoneNumber, {super.key});
  final String phoneNumber;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fatherNameController = TextEditingController(text: "Shiva");
    final motherNameController = TextEditingController(text: "Parbati");
    final fatherNameNode = FocusNode();
    final motherNameNode = FocusNode();
    var kycData = ref.watch(forParentsSameProvider(phoneNumber));
    ref.listen(forParentsSameProvider(phoneNumber), (last, next) {
      kycData = next;
      next.maybeWhen(
        orElse: () {},
        data: (data) {
          // if (data.first.motherName != null && data.first.fatherName != null) {
          //   CustomAlertDialog.show(
          //     context,
          //     title: "Updated KYC",
          //     body:
          //         "The kyc update has been completed with the addition of your father and mother name",
          //     dialogType: CustomDialogType.success,
          //     onCancelOnPressed: () {},
          //     onOkPressed: () {
          //       CustomAnimatedSnackbar.show(
          //         "User Kyc Updated Successfully!",
          //         context: context,
          //         type: AnimatedSnackBarType.success,
          //         backgroundColor: Colors.green,
          //       );
          //       Navigator.of(context).push(
          //         MaterialPageRoute(
          //           builder: (context) {
          //             return Homepage();
          //           },
          //         ),
          //       );
          //     },
          //   );
          // } else {
          //   print("null");
          // }
        },
      );
    });
    return Scaffold(
      appBar: AppBar(
        title: StyledText(text: "Know Your Customer: Parents Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomTextField(
              controller: fatherNameController,
              valueName: "father's name",
              focusNode: fatherNameNode,
            ),
            CustomTextField(
              controller: motherNameController,
              valueName: "mother's name",
              focusNode: motherNameNode,
            ),
            kycData.maybeWhen(
              orElse: () {
                return const CircularProgressIndicator();
              },
              data: (data) {
                if (data.isNotEmpty) {
                  return Column(
                    children: [
                      Text(
                        data.first.toString(),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await _addParents(
                            ref,
                            context,
                            phoneNumber,
                            motherNameController.text,
                            fatherNameController.text,
                          );
                        },
                        child: const Text("Submit"),
                      ),
                    ],
                  );
                } else {
                  return const Text("[]");
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future _addParents(
    WidgetRef ref,
    BuildContext context,
    String phoneNumber,
    String motherName,
    String fatherName,
  ) async {
    try {
      await ref
          .read(addParentsInfoProvider.notifier)
          .addParents(phoneNumber, motherName, fatherName);
      await Future.delayed(const Duration(seconds: 4));
      final readState = ref.watch(forParentsSameProvider(phoneNumber));
      
      readState.maybeWhen(
        orElse: () {},
        data: (data) {
          if (data.first.motherName != null && data.first.fatherName != null) {
            CustomAlertDialog.show(
              context,
              title: "Updated KYC",
              body:
                  "The kyc update has been completed with the addition of your father and mother name",
              dialogType: CustomDialogType.success,
              onCancelOnPressed: () {},
              onOkPressed: () {
                CustomAnimatedSnackbar.show(
                  "User Kyc Updated Successfully!",
                  context: context,
                  type: AnimatedSnackBarType.success,
                  backgroundColor: Colors.green,
                );
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Homepage();
                    },
                  ),
                );
              },
            );
          } else {
            if (kDebugMode) {
              print("null");
            }
          }
        },
      );
    } on KycException catch (e) {
      throw KycException(message: e.message);
    }
  }
}
