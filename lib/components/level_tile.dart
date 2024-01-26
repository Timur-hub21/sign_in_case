import 'package:flutter/material.dart';
import 'package:sign_in_case/constants/app_colors.dart';

class LevelTile extends StatelessWidget {
  final bool isFirstLevel;
  final bool isSecondLevel;
  final bool isThirdLevel;

  const LevelTile({
    super.key,
    required this.isFirstLevel,
    required this.isSecondLevel,
    required this.isThirdLevel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      width: 196,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Divider(thickness: 1, color: AppColors.lightGrey),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 36,
                width: 36,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:
                          isFirstLevel ? AppColors.green : Colors.transparent,
                    ),
                    color: isFirstLevel
                        ? AppColors.whiteBackground
                        : AppColors.textFormFieldFocusedBorderColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text('1'),
                  ),
                ),
              ),
              isFirstLevel ? const SizedBox(width: 10) : const Spacer(),
              Visibility(
                visible: isFirstLevel,
                child: Icon(
                  Icons.done,
                  size: 20,
                  color: AppColors.customButtonColor,
                ),
              ),
              isFirstLevel
                  ? const SizedBox(width: 14)
                  : const SizedBox.shrink(),
              SizedBox(
                height: 36,
                width: 36,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:
                          isSecondLevel ? AppColors.green : Colors.transparent,
                    ),
                    color: isSecondLevel
                        ? AppColors.whiteBackground
                        : AppColors.textFormFieldFocusedBorderColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text('2'),
                  ),
                ),
              ),
              isSecondLevel ? const SizedBox(width: 10) : const Spacer(),
              Visibility(
                visible: isSecondLevel,
                child: Icon(
                  Icons.done,
                  size: 20,
                  color: AppColors.customButtonColor,
                ),
              ),
              isSecondLevel
                  ? const SizedBox(width: 14)
                  : const SizedBox.shrink(),
              SizedBox(
                height: 36,
                width: 36,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:
                          isThirdLevel ? AppColors.green : Colors.transparent,
                    ),
                    color: isThirdLevel
                        ? AppColors.whiteBackground
                        : AppColors.textFormFieldFocusedBorderColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text('3'),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
