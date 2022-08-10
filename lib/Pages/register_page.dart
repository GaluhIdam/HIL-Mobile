import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:hil_mobile/Pages/login_page.dart';
import 'package:hil_mobile/Services/auth_services.dart';
import 'package:hil_mobile/Widgets/auth_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _name = '';
  String _employeeId = '';
  String _email = '';
  String _password = '';
  String _passwordConfirm = '';

  registerPressed() async {
    bool employeeIdValid = RegExp(r'^[0-9]{8}$').hasMatch(_employeeId);
    if (employeeIdValid) {
      http.Response response = await AuthServices.register(
          _name, _employeeId, _email, _password, _passwordConfirm);
      Map responseMap = json.decode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const LoginPage(),
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
              content: Text('Employee ID must be 8 digits'),
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
                        'Register HIL GMF',
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
                    'Please enter your name, Employee ID, email and password to register',
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
                        hintText: 'Please Enter Your name',
                        labelText: 'Name'),
                    onChanged: (value) {
                      _name = value;
                    },
                  ),
                  SizedBox(
                    height: 25,
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
                        hintText: 'Please Enter Your Email',
                        labelText: 'Email'),
                    onChanged: (value) {
                      _email = value;
                    },
                  ),
                  SizedBox(
                    height: 25,
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
                        hintText: 'Please Confirm Your Password',
                        labelText: 'Confirm Password'),
                    onChanged: (value) {
                      _passwordConfirm = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                            fontSize: 14, color: Color.fromRGBO(1, 98, 153, 1)),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: Text(
                          'Login',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(1, 98, 153, 1)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  AuthButton(
                    btnText: 'Register',
                    onBtnPressed: () => registerPressed(),
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
