import 'package:flutter/material.dart';
import 'package:hil_mobile/login_page.dart';

class WelcomePage extends StatefulWidget {
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
          }
        ));
  }

  Future<String> _login() async {
    await Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return LoginPage();
          },
        ),
      );
    });

    return "Logined";
  }
}
