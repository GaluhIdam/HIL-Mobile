import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hil_mobile/dashboard_page.dart';
import 'package:hil_mobile/task_to_do_page.dart';

const String page1 = "Task To Do";
const String page2 = "HIL Management";

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  late List<Widget> _pages;
  late Widget _page1;
  late Widget _page2;
  late int _currentIndex;
  late Widget _currentPage;

  @override
  void initState() {
    super.initState();
    _page1 = const TaskToDoPage();
    _page2 = const DashboardPage();
    _pages = [_page1, _page2];
    _currentIndex = 0;
    _currentPage = _page1;
  }

  void _changeTab(int index) {
    setState(() {
      _currentIndex = index;
      _currentPage = _pages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentPage,
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            _changeTab(index);
          },
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
                label: page1,
                icon: Image(
                  image: AssetImage('assets/task_to_do.png'),
                  width: 35,
                  height: 40,
                ),
                activeIcon: Image(
                  image: AssetImage('assets/task_to_do_active.png'),
                  width: 35,
                  height: 40,
                )),
            BottomNavigationBarItem(
                label: page2,
                icon: Image(
                  image: AssetImage('assets/hil_management.png'),
                  width: 35,
                ),
                activeIcon: Image(
                  image:
                      AssetImage('assets/hil_management_active.png'),
                  width: 35,
                  height: 40,
                )),
          ],
          selectedItemColor: Color.fromRGBO(1, 98, 153, 1)),
    );
  }
}
