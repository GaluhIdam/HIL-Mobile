import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:hil_mobile/Services/auth_services.dart';
import 'package:hil_mobile/Widgets/auth_button.dart';

import '../navigation_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _employeeId = '';
  String _password = '';

  loginPressed() async {
    if (_employeeId.isNotEmpty && _password.isNotEmpty) {
      http.Response response = await AuthServices.login(_employeeId, _password);
      Map responseMap = json.decode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const NavigationPage(),
            ));
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text(responseMap['message']),
                actions: <Widget>[
                  FlatButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
      }
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Employee ID and Password are required'),
              actions: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Column(
          children: [
            Image(
              image: AssetImage('assets/login.png'),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(25),
              child: Column(
                children: [
                  SizedBox(
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
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Please enter your Employee ID and Registered Password to access the system',
                    style: TextStyle(
                        fontSize: 14, color: Color.fromRGBO(1, 98, 153, 1)),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(1, 98, 153, 1)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Please Enter Your Employee ID',
                        labelText: 'Employee ID'),
                    onChanged: (value) {
                      _employeeId = value;
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(1, 98, 153, 1)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Please Enter Your Password',
                        labelText: 'Password'),
                    onChanged: (value) {
                      _password = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      const Text('Forgot Password?',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(1, 98, 153, 1))),
                      TextButton(
                        child: Text(
                          'Reset Password',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(1, 98, 153, 1)),
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  AuthButton(
                    btnText: 'Login',
                    onBtnPressed: () => loginPressed(),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    ));
  }
}
