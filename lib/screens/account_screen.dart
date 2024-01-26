import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sign_in_case/constants/app_colors.dart';
import 'package:sign_in_case/constants/app_icons.dart';

import 'package:sign_in_case/widgets/account_screen_body.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.main,
        appBar: AppBar(
          shape: ContinuousRectangleBorder(
            side: BorderSide(
              color: AppColors.bottomNavBar,
              width: 1,
            ),
          ),
          backgroundColor: AppColors.main,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                AppIcons.blueButton,
                width: 8.68,
                height: 17.26,
              ),
              const SizedBox(width: 9),
              Text(
                'Мой аккаунт',
                style:
                    TextStyle(fontSize: 16, color: AppColors.selectedItemColor),
              ),
              const Spacer(flex: 1),
              Text(
                'Аккаунт',
                style: TextStyle(
                  fontSize: 17,
                  color: AppColors.textColor,
                ),
              ),
              const Spacer(flex: 6),
            ],
          ),
        ),
        body: const AccountScreenBody(),
      );
}
