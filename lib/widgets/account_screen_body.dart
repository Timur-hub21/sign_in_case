import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_case/components/custom_tile.dart';
import 'package:sign_in_case/components/modal_bottom_sheet.dart';
import 'package:sign_in_case/constants/app_colors.dart';
import 'package:sign_in_case/constants/app_icons.dart';
import 'package:sign_in_case/providers/account_provider.dart';
import 'package:sign_in_case/screens/first_name_screen.dart';
import 'package:sign_in_case/screens/second_name_screen.dart';

class AccountScreenBody extends StatefulWidget {
  const AccountScreenBody({super.key});

  @override
  State<AccountScreenBody> createState() => _AccountScreenBodyState();
}

class _AccountScreenBodyState extends State<AccountScreenBody> {
  String? firstName;
  String? secondName;

  Future<void> navigateToFirstNameScreen(BuildContext context) async {
    final String settedName = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const FirstNameScreen(),
        ));

    setState(() => firstName = settedName);
  }

  Future<void> navigateToSecondNameScreen(BuildContext context) async {
    final String settedName = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SecondNameScreen(),
      ),
    );

    setState(() => secondName = settedName);
  }

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    final imageProvider = Provider.of<AccountProvider>(context, listen: false);
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      imageProvider.setImage(XFile(pickedFile.path));

      if (!context.mounted) return;
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 24, 8, 0),
      child: Column(
        children: [
          Center(
            child: InkWell(
              onTap: () => showModalBottomSheet(
                backgroundColor: Colors.transparent,
                isDismissible: false,
                context: context,
                builder: (BuildContext context) => CustomModalBottomSheet(
                  onCameraCallback: () =>
                      _pickImage(context, ImageSource.camera),
                  onGalleryCallback: () =>
                      _pickImage(context, ImageSource.gallery),
                ),
              ),
              child: Stack(
                children: [
                  Consumer<AccountProvider>(
                    builder: (context, image, child) {
                      return image.selectedImage != null
                          ? CircleAvatar(
                              backgroundColor: AppColors.bottomNavBar,
                              radius: 45,
                              backgroundImage: FileImage(
                                File(image.selectedImage!.path),
                              ),
                            )
                          : CircleAvatar(
                              backgroundColor: AppColors.bottomNavBar,
                              radius: 45,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: SvgPicture.asset(
                                  AppIcons.selectedPerson,
                                  width: 59,
                                  height: 59,
                                ),
                              ),
                            );
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    left: 60,
                    child: SizedBox(
                      width: 32,
                      height: 31,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.main,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.34),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 5.34,
                                  height: 5.3,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.selectedItemColor,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.34,
                                  height: 5.3,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.selectedItemColor,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.34,
                                  height: 5.3,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.selectedItemColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'apollo@gmail.com',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.unselectedItemColor,
            ),
          ),
          const SizedBox(height: 28),
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.tileBackGround,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(13.0),
              ),
            ),
            child: Column(
              children: [
                CustomTile(
                  title: 'Имя',
                  tileValue: firstName,
                  onTap: () => navigateToFirstNameScreen(context),
                ),
                CustomTile(
                  title: 'Фамилия',
                  tileValue: secondName,
                  onTap: () => navigateToSecondNameScreen(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
