import 'package:flutter/material.dart';
import 'package:hil_mobile/task_to_do_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                  Container(
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
                        fontSize: 14,
                        color: Color.fromRGBO(1, 98, 153, 1)),
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
                          borderSide: BorderSide(
                              color: Color.fromRGBO(1, 98, 153, 1)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: EdgeInsets.all(15),
                        labelText: 'Employee ID'),
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
                          borderSide: BorderSide(
                              color: Color.fromRGBO(1, 98, 153, 1)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: EdgeInsets.all(15),
                        labelText: 'Password'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      color: Color(0x00016299),
                      width: double.infinity,
                      child: Text(
                        'Forgot password?',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(1, 98, 153, 1),
                        ),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(1, 98, 153, 1),
                        minimumSize: Size.fromHeight(45),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return TaskToDoPage();
                      }));
                    },
                    child: Text(
                      'Log in',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
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
