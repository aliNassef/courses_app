import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../translations/locale_keys.g.dart';
import '../utils/utils.dart';
import 'widgets.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: AdaptiveTextField(
        textInputAction: TextInputAction.search,

        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          filled: true,
          hint: Text(
            LocaleKeys.what_do_you_want_to_learn.tr(),
            style: context.appTheme.medium14.copyWith(
              color: AppColors.black.withValues(alpha: 0.49),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: const Icon(
            Icons.tune,
            color: AppColors.primary,
          ),
          prefixIconColor: AppColors.black.withValues(alpha: 0.56),
          fillColor: AppColors.white,
          border: _buildOutLineBorder(),
          enabledBorder: _buildOutLineBorder(),
          focusedBorder: _buildOutLineBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder _buildOutLineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: const BorderSide(color: Colors.transparent),
    );
  }
}
