import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:courses_app/core/constants.dart';
import 'package:courses_app/core/extensions/padding_extension.dart';
import 'package:courses_app/core/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AdaptiveAppBar buildCourseDetailsAppBar(BuildContext context) {
  return AdaptiveAppBar(
    appBar: AppBar(
      leading: const Icon(
        Icons.arrow_back,
        color: AppColors.black,
      ).withHorizontalPadding(Constants.hp16),
      centerTitle: true,
      title: Text(
        'Course Details',
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
        'Course Details',
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
