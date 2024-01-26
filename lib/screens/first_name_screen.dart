import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sign_in_case/components/custom_text_form_field.dart';
import 'package:sign_in_case/constants/app_colors.dart';
import 'package:sign_in_case/constants/app_icons.dart';

class FirstNameScreen extends StatefulWidget {
  const FirstNameScreen({super.key});

  @override
  State<FirstNameScreen> createState() => _FirstNameScreenState();
}

class _FirstNameScreenState extends State<FirstNameScreen> {
  final TextEditingController firstNameController = TextEditingController();

  void setFirstName(BuildContext context) {
    final String firstName = firstNameController.text;
    Navigator.pop(context, firstName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            InkWell(
              onTap: () => setFirstName(context),
              child: SvgPicture.asset(
                AppIcons.blueButton,
                width: 8.68,
                height: 17.26,
              ),
            ),
            const SizedBox(width: 9),
            InkWell(
              onTap: () => setFirstName(context),
              child: Text(
                'Аккаунт',
                style:
                    TextStyle(fontSize: 16, color: AppColors.selectedItemColor),
              ),
            ),
            const Spacer(flex: 2),
            Text(
              'Ваше Имя',
              style: TextStyle(
                fontSize: 17,
                color: AppColors.textColor,
              ),
            ),
            const Spacer(flex: 6),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 24, 9, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              controller: firstNameController,
              hintText: 'Ваше Имя',
            ),
          ],
        ),
      ),
    );
  }
}
