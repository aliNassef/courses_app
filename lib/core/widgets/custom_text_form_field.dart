import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'widgets.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
  });
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return AdaptiveTextFormField(
      style: context.appTheme.regular14.copyWith(
        color: AppColors.black,
      ),
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: context.appTheme.regular14.copyWith(
          color: const Color(0xff617589),
        ),
        errorStyle: context.appTheme.bold10.copyWith(
          color: AppColors.red,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.r),
          ),
          borderSide: const BorderSide(
            color: Color(0xffdbe0e6),
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.r),
          ),
          borderSide: const BorderSide(
            color: Color(0xffdbe0e6),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: Color(0xffdbe0e6),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.red,
          ),
        ),
        filled: true,
        fillColor: AppColors.white,
      ),
    );
  }
}
