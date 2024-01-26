import 'package:flutter/material.dart';
import 'package:sign_in_case/constants/app_colors.dart';

class CustomModalBottomSheet extends StatelessWidget {
  final VoidCallback onCameraCallback;
  final VoidCallback onGalleryCallback;

  const CustomModalBottomSheet({
    super.key,
    required this.onCameraCallback,
    required this.onGalleryCallback,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 42,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.tileBackGround,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(13.0),
                  ),
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: AppColors.dividerColor,
                    ),
                    top: BorderSide(
                      width: 0,
                      color: AppColors.dividerColor,
                    ),
                    left: BorderSide(
                      width: 0,
                      color: AppColors.dividerColor,
                    ),
                    right: BorderSide(
                      width: 0,
                      color: AppColors.dividerColor,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Выберите фото',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.unselectedItemColor,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: onCameraCallback,
              child: SizedBox(
                height: 60,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.main,
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: AppColors.dividerColor,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Камера',
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.selectedItemColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: onGalleryCallback,
              child: SizedBox(
                height: 60,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.main,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(13.0),
                    ),
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: AppColors.dividerColor,
                      ),
                      top: BorderSide(
                        width: 0,
                        color: AppColors.dividerColor,
                      ),
                      left: BorderSide(
                        width: 0,
                        color: AppColors.dividerColor,
                      ),
                      right: BorderSide(
                        width: 0,
                        color: AppColors.dividerColor,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Галерея Фото',
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.selectedItemColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: SizedBox(
                height: 60,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.main,
                    borderRadius: const BorderRadius.all(Radius.circular(13.0)),
                  ),
                  child: Center(
                    child: Text(
                      'Закрыть',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.selectedItemColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
