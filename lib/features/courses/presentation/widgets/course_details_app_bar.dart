import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/translations/locale_keys.g.dart';

AdaptiveAppBar buildCourseDetailsAppBar(BuildContext context) {
  return AdaptiveAppBar(
    appBar: AppBar(
      leading: const Icon(
        Icons.arrow_back,
        color: AppColors.black,
      ).withHorizontalPadding(Constants.hp16),
      centerTitle: true,
      title: Text(
        LocaleKeys.course_details.tr(),
        style: context.appTheme.bold14.copyWith(
          color: AppColors.black,
        ),
      ),
      actions: [
        const Icon(
          Icons.share,
          color: AppColors.black,
        ).withHorizontalPadding(Constants.hp16),
      ],
    ),
    cupertinoNavigationBar: CupertinoNavigationBar(
      leading: const Icon(
        CupertinoIcons.back,
        color: AppColors.black,
      ).withHorizontalPadding(Constants.hp16),
      middle: Text(
        LocaleKeys.course_details.tr(),
        style: context.appTheme.bold14.copyWith(
          color: AppColors.black,
        ),
      ),
      trailing: const Icon(
        CupertinoIcons.share,
        color: AppColors.black,
      ).withHorizontalPadding(Constants.hp16),
    ),
  );
}
