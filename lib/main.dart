import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hil_mobile/Pages/dashboard_page.dart';
import 'package:hil_mobile/Pages/follow_on_list_page.dart';
import 'package:hil_mobile/Pages/login_page.dart';
import 'package:hil_mobile/Pages/task_details_page.dart';
import 'package:hil_mobile/Pages/task_to_do_page.dart';
import 'package:hil_mobile/navigation_page.dart';
import 'package:hil_mobile/Pages/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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
          WelcomePage.routeName: ((context) => WelcomePage()),
          LoginPage.routeName: ((context) => LoginPage()),
          TaskToDoPage.routeName: (context) => TaskToDoPage(),
          NavigationPage.routeName: (context) => NavigationPage(),
          DashboardPage.routeName: (context) => DashboardPage(),
          TaskDetailsPage.routeName: (context) => TaskDetailsPage(),
          FollowOnListPage.routeName: (context) => FollowOnListPage(),
        });
  }
}
