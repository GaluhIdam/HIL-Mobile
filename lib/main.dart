import 'package:flutter/material.dart';
import 'package:hil_mobile/Pages/task_details_page.dart';
import 'package:hil_mobile/Pages/task_to_do_page.dart';
import 'package:hil_mobile/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const WelcomePage(),
        routes: {
          TaskToDoPage.routeName: (context) => TaskToDoPage(),
          TaskDetailsPage.routeName: (context) => TaskDetailsPage(),
        });
  }
}
