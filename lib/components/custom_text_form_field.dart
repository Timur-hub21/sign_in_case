import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sign_in_case/constants/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String? title;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final String? hintText;

  const CustomTextFormField({
    this.title,
    required this.controller,
    this.textInputType,
    this.inputFormatters,
    this.onChanged,
    this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null
            ? Text(
                title ?? '',
                style: const TextStyle(fontSize: 12),
              )
            : const SizedBox.shrink(),
        title != null ? const SizedBox(height: 10) : const SizedBox.shrink(),
        DecoratedBox(
          decoration: title != null
              ? const BoxDecoration()
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(13.0),
                  color: AppColors.tileBackGround,
                ),
          child: SizedBox(
            height: 46,
            child: TextFormField(
              onChanged: onChanged,
              inputFormatters: inputFormatters,
              keyboardType: textInputType ?? TextInputType.text,
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle:
                    TextStyle(fontSize: 16, color: AppColors.dividerColor),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                border: InputBorder.none,
                enabledBorder: title != null
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 1,
                          color: AppColors.textFormFieldEnabledBorderColor,
                        ),
                      )
                    : null,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 2,
                    color: AppColors.textFormFieldFocusedBorderColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
