import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hil_mobile/Pages/task_to_do_page.dart';
import 'package:hil_mobile/Services/authService.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const routeName = "/login_page";
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _employeeId = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  final _formKey = GlobalKey<FormState>();
  DateTime? currentBackPressTime;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          body: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 0.8),
        child: WillPopScope(
            onWillPop: onWillPop,
            child: ListView(
              children: [
                Column(
                  children: [
                    const Image(
                      image: AssetImage('assets/login.png'),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                        padding: const EdgeInsets.all(25),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              const SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    'Log in HIL GMF',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(1, 98, 153, 1),
                                    ),
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Please enter your Employee ID and Registered Password to access the system',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(1, 98, 153, 1)),
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your employee ID';
                                  }
                                  return null;
                                },
                                controller: _employeeId,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color.fromRGBO(1, 98, 153, 1)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    contentPadding: const EdgeInsets.all(15),
                                    labelText: 'Employee ID'),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                                controller: _password,
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color.fromRGBO(1, 98, 153, 1)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    contentPadding: const EdgeInsets.all(15),
                                    labelText: 'Password'),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              RoundedLoadingButton(
                                borderRadius: 10,
                                height: 45,
                                width: 340,
                                color: Color.fromRGBO(1, 98, 153, 1),
                                controller: _btnController,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          duration: Duration(seconds: 1),
                                          behavior: SnackBarBehavior.floating,
                                          content:
                                              Text('Logging your account...')),
                                    );
                                    AuthService.login(
                                            _employeeId.text, _password.text)
                                        .then((value) {
                                      if (value['accessToken'] != null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              backgroundColor: Colors.green,
                                              content: Text(
                                                value['message'],
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              )),
                                        );
                                        AuthService.persistToken(
                                            value['accessToken']);
                                        Navigator.pushNamed(
                                          context,
                                          TaskToDoPage.routeName,
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              backgroundColor: Colors.red,
                                              content: Text(
                                                value['message'],
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              )),
                                        );
                                        Timer(Duration(seconds: 1), () {
                                          _btnController.reset();
                                        });
                                      }
                                    });
                                  } else {
                                    Timer(Duration(milliseconds: 1), () {
                                      _btnController.reset();
                                    });
                                  }
                                },
                                child: Text('Log In',
                                    style: TextStyle(color: Colors.white)),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ],
            )),
      )),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Back again to exit");
      return Future.value(false);
    }
    return Future.value(true);
  }
}
