import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sign_in_case/constants/app_colors.dart';
import 'package:sign_in_case/constants/app_icons.dart';
import 'package:sign_in_case/screens/account_screen.dart';
import 'package:sign_in_case/screens/my_projects_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> screens = <Widget>[
    const MyProjectsScren(),
    const AccountScreen(),
  ];

  void _changeScreen(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: PreferredSize(
        preferredSize: const Size.fromHeight(75.0),
        child: BottomNavigationBar(
          selectedFontSize: 11,
          unselectedFontSize: 11,
          unselectedItemColor: AppColors.unselectedItemColor,
          selectedItemColor: AppColors.selectedItemColor,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.bottomNavBar,
          currentIndex: _currentIndex,
          onTap: _changeScreen,
          items: [
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                AppIcons.selectedTasks,
                width: 20.33,
                height: 19.78,
              ),
              icon: SvgPicture.asset(
                AppIcons.tasksGrey,
                width: 20.33,
                height: 19.78,
              ),
              label: 'Мои проекты',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                AppIcons.selectedPerson,
                width: 17.35,
                height: 23.1,
              ),
              icon: SvgPicture.asset(
                AppIcons.personGrey,
                width: 17.35,
                height: 23.1,
              ),
              label: 'Мой аккаунт',
            ),
          ],
        ),
      ),
    );
  }
}
