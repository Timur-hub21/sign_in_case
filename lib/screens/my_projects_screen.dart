import 'package:flutter/material.dart';
import 'package:sign_in_case/constants/app_colors.dart';

class MyProjectsScren extends StatelessWidget {
  const MyProjectsScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.main,
        elevation: 0,
        toolbarHeight: 10,
        shape: ContinuousRectangleBorder(
          side: BorderSide(
            color: AppColors.bottomNavBar,
            width: 1,
          ),
        ),
      ),
      backgroundColor: AppColors.whiteBackground,
    );
  }
}
