import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_case/constants/app_colors.dart';
import 'package:sign_in_case/constants/app_icons.dart';
import 'package:sign_in_case/providers/sign_in_provider.dart';
import 'package:sign_in_case/widgets/sign_in_confirmation_screen_body.dart';

class SignInConfirmationScreen extends StatelessWidget {
  final String? verificationCodeId;
  final String phoneNumber;

  const SignInConfirmationScreen({
    super.key,
    required this.verificationCodeId,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    final SignInProvider signInProvider = Provider.of<SignInProvider>(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.whiteBackground,
        appBar: AppBar(
          backgroundColor: AppColors.whiteBackground,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(
                  AppIcons.appBarLeadingIcon,
                  width: 20,
                  height: 15,
                ),
              ),
            ],
          ),
        ),
        body: SignInConfirmationScreenBody(
          verificationCodeId: signInProvider.verificationIdGetter,
          phoneNumber: phoneNumber,
        ),
      ),
    );
  }
}
