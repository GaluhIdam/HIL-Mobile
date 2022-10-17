import 'package:flutter/material.dart';
import 'package:hil_mobile/Pages/dashboard_page.dart';
import 'package:hil_mobile/Pages/task_to_do_page.dart';

class NavigationPage extends StatefulWidget {
  static const routeName = "/task_to_do_pages";
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final PageController _pageController = PageController();
  final List<Widget> _screen = [TaskToDoPage(), DashboardPage()];

  int _selectedIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onTap(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _screen,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onTap,
          items: [
            BottomNavigationBarItem(
                label: 'Task To Do',
                icon: Image(
                  image: AssetImage('assets/task_to_do.png'),
                  width: 25,
                  height: 30,
                ),
                activeIcon: Image(
                  image: AssetImage('assets/task_to_do_active.png'),
                  width: 25,
                  height: 30,
                )),
            BottomNavigationBarItem(
                label: 'HIL Management',
                icon: Image(
                  image: AssetImage('assets/hil_management.png'),
                  width: 25,
                  height: 30,
                ),
                activeIcon: Image(
                  image: AssetImage('assets/hil_management_active.png'),
                  width: 25,
                  height: 30,
                )),
          ],
          selectedItemColor: Color.fromRGBO(1, 98, 153, 1)),
    );
  }
}
