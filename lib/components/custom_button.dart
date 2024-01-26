import 'package:flutter/material.dart';
import 'package:sign_in_case/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final bool isActive;
  final VoidCallback onTap;
  final String title;

  const CustomButton({
    super.key,
    required this.isActive,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: isActive ? onTap : null,
        child: SizedBox(
          height: 53,
          width: 285,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: isActive
                  ? AppColors.textFormFieldFocusedBorderColor
                  : AppColors.customButtonColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.darkGrey,
                ),
              ),
            ),
          ),
        ),
      );
}
