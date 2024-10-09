import 'package:flutter/material.dart';
import 'package:components/components.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veda_news/data/models/user_model.dart';
import 'package:veda_news/presentation/pages/sliver_appbar.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _emailController =
      TextEditingController(text: "Kapil");
  final TextEditingController _passwordController =
      TextEditingController(text: "Password@123");
  final passwordFocusNode = FocusNode();
  final emailFocusNode = FocusNode();

  Future<void> _login(
    BuildContext context,
    WidgetRef ref, {
    required String username,
    required String password,
    String? rememberToken,
  }) async {
    // await ref.read(loginProvider.notifier).login(
    //       username: username,
    //       conext: context,
    //       password: password,
    //       rememberToken: rememberToken,
    //     );

    if (context.mounted) {
      FocusScope.of(context).unfocus();
    }
  }

  UserModel? state;

  @override
  Widget build(BuildContext context) {
    // ref.listen(isLoadingProvider, (last, next) {
    //   isLoading = true;
    // });

    // ref.listen(
    //   loginProvider,
    //   (previous, next) {
    //     state = next;
    //   },
    // );
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  "https://i.pinimg.com/originals/e9/11/70/e91170f13c00f6484fc957d5429d8179.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  CustomTextField(
                    focusNode: emailFocusNode,
                    controller: _emailController,
                    valueName: "email",
                  ),
                  CustomTextField(
                    focusNode: passwordFocusNode,
                    controller: _passwordController,
                    valueName: "password",
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // ref
                      //     .read(isLoadingProvider.notifier)
                      //     .update((state) => true);
                      await _login(
                        context,
                        ref,
                        username: _emailController.text,
                        password: _passwordController.text,
                        rememberToken:
                            "dn1apH6Oo7f8OBYT1SGGQn:APA91bEeJPOzzqd2iqg2tflnZ_e1uZF5p4AbbFrVHMOLb6Znh6Uhe_vYxDit41J3KFbzUKYybpLKiwFTEdSq-yRSqFbJsbsQNuV3kF1ACsKUd-lK_8RXFoyAeGCje2vg6D_QMJq3fm6i",
                      );

                      // print(isLoading);
                      if (state != null) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const SliverHomePage();
                            },
                          ),
                        );
                      }
                    },
                    child:
                        // ref.watch(isLoadingProvider)
                        //     ? const Center(child: CircularProgressIndicator())
                        //     :
                        const Text("Login"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
