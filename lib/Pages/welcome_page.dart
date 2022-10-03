import 'package:flutter/material.dart';
import 'package:hil_mobile/Pages/login_page.dart';
import 'package:hil_mobile/Pages/task_to_do_page.dart';
import 'package:hil_mobile/Services/authService.dart';

class WelcomePage extends StatefulWidget {
  static const routeName = "/welcome_page";
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _login(),
            builder: (context, snapshot) {
              return Stack(
                children: const [
                  Image(
                    image: AssetImage('assets/welcome.png'),
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.center,
                  ),
                  Center(
                    child: Image(
                      image: AssetImage('assets/title.png'),
                      width: 300,
                    ),
                  )
                ],
              );
            }));
  }

  Future<String> _login() async {
    await Future.delayed(Duration(seconds: 2)).then((value) {
      AuthService.hasToken().then((value) {
        if (value['logging'] == true) {
          Navigator.pushReplacementNamed(context, TaskToDoPage.routeName);
        } else {
          Navigator.pushReplacementNamed(context, LoginPage.routeName);
        }
      });
    });

    return "Logined";
  }
}
