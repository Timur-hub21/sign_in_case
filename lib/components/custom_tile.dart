import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sign_in_case/constants/app_colors.dart';
import 'package:sign_in_case/constants/app_icons.dart';

class CustomTile extends StatelessWidget {
  final String title;
  final String? tileValue;
  final VoidCallback onTap;

  const CustomTile({
    super.key,
    required this.title,
    this.tileValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 48,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.dividerColor,
                ),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 13.5, horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, color: AppColors.textColor),
                  ),
                  const Spacer(),
                  Text(
                    tileValue ?? 'Настроить',
                    style: TextStyle(
                      fontSize: 16,
                      color: tileValue == null
                          ? AppColors.dividerColor
                          : AppColors.unselectedItemColor,
                    ),
                  ),
                  const SizedBox(width: 10),
                  SvgPicture.asset(
                    AppIcons.arrowRight,
                    width: 8.68,
                    height: 17.26,
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
