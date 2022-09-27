import 'package:flutter/material.dart';
import 'package:hil_mobile/Pages/task_to_do_page.dart';
import 'package:hil_mobile/Services/loginServices.dart';
import 'package:hil_mobile/navigation_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _employeeId = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
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
                            fontSize: 14, color: Color.fromRGBO(1, 98, 153, 1)),
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
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(1, 98, 153, 1),
                            minimumSize: const Size.fromHeight(45),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(seconds: 1),
                                  behavior: SnackBarBehavior.floating,
                                  content: Text('Logging your account...')),
                            );
                            AuthService.login(_employeeId.text, _password.text)
                                .then((value) {
                              if (value['accessToken'] != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.green,
                                      content: Text(
                                        value['message'],
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )),
                                );
                                Navigator.pushNamed(
                                    context, TaskToDoPage.routeName,
                                    arguments: {
                                      'data': value['data']['user'],
                                      'token': value['accessToken'],
                                    });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.red,
                                      content: Text(
                                        value['message'],
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )),
                                );
                              }
                            });
                          }
                        },
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ],
    ));
  }
}
