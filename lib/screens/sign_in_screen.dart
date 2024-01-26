import 'package:flutter/material.dart';
import 'package:sign_in_case/constants/app_colors.dart';
import 'package:sign_in_case/constants/app_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sign_in_case/widgets/sign_in_screen_body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.whiteBackground,
          appBar: AppBar(
            backgroundColor: AppColors.whiteBackground,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                SvgPicture.asset(
                  AppIcons.appBarLeadingIcon,
                  width: 20,
                  height: 15,
                ),
              ],
            ),
          ),
          body: const SignInScreenBody(),
        ),
      );
}
