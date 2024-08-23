import 'package:flutter/material.dart';
import 'package:veda_news/data/models/source.dart';
import 'package:veda_news/data/repositories/source_repository.dart';
import 'package:veda_news/presentation/pages/auth/login.dart';
import 'package:veda_news/presentation/widgets/styled_text.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = "", password = "", name = "";
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mailController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  String? selectedValue;
  final SourceRepository _sourceRepository = SourceRepository();

  Future<void> register() async {
    if (password != "" &&
        name != "" &&
        email != "" &&
        password.isNotEmpty &&
        name.isNotEmpty &&
        email.isNotEmpty) {
      try {} catch (e) {}
    }
  }

  @override
  void initState() {
    super.initState();
    fetchItemsFromDatabase();
  }

  Future<List<Source>> fetchItemsFromDatabase() async {
    return _sourceRepository.fetchSourceFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          child: Column(
            children: [
              SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/images/news1.jpg",
                    fit: BoxFit.cover,
                  )),
              const SizedBox(
                height: 15.0,
              ),
              SizedBox(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const StyledText(
                        fontSize: 16,
                        text: "Company Name : ",
                        fontWeight: FontWeight.bold,
                      ),
                      FutureBuilder(
                        future: fetchItemsFromDatabase(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (snapshot.data != null &&
                              snapshot.data!.isNotEmpty &&
                              snapshot.hasData) {
                            List<Source> source =
                                snapshot.data! as List<Source>;
                            return Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              // have to make adjustments to display data
                              child: DropdownButton<String>(
                                focusColor: Colors.blue[400],
                                dropdownColor: Colors.blue[200],
                                value: selectedValue,
                                hint: const Text('Select an item'),
                                onChanged: (String? newValue) {
                                  //here
                                  setState(() {
                                    selectedValue = newValue;
                                  });
                                },
                                items: source.map<DropdownMenuItem<String>>(
                                    (Source source) {
                                  return DropdownMenuItem<String>(
                                    value: source.id,
                                    child: Text(source.name ?? 'Unknown'),
                                  );
                                }).toList(),
                              ),
                            );
                          } else if (snapshot.data == null &&
                              snapshot.data!.isEmpty) {
                            return const Center(
                              child: Text("Data not available!"),
                            );
                          } else {
                            return const Center(
                              child: Text("Something went wrong"),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 30.0),
                        decoration: BoxDecoration(
                            color: const Color(0xFFedf0f8),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Name';
                            }
                            return null;
                          },
                          controller: nameController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Name",
                              hintStyle: TextStyle(
                                  color: Color(0xFFb2b7bf), fontSize: 18.0)),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 30.0),
                        decoration: BoxDecoration(
                            color: const Color(0xFFedf0f8),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Email';
                            }
                            return null;
                          },
                          controller: mailController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email",
                              hintStyle: TextStyle(
                                  color: Color(0xFFb2b7bf), fontSize: 18.0)),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 30.0),
                        decoration: BoxDecoration(
                            color: const Color(0xFFedf0f8),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                          controller: passwordController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: TextStyle(
                                  color: Color(0xFFb2b7bf), fontSize: 18.0)),
                          obscureText: true,
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              email = mailController.text;
                              name = nameController.text;
                              password = passwordController.text;
                            });
                            register();
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 30.0),
                          decoration: BoxDecoration(
                              color: const Color(0xFF273671),
                              borderRadius: BorderRadius.circular(30)),
                          child: const Center(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?",
                      style: TextStyle(
                          color: Color(0xFF8c8e98),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(
                    width: 5.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LogIn()));
                    },
                    child: const Text(
                      "LogIn",
                      style: TextStyle(
                          color: Color(0xFF273671),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
