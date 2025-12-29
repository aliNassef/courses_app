import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/utils/utils.dart';

AdaptiveAppBar buildCourseAppBar(BuildContext context) {
  return AdaptiveAppBar(
    appBar: AppBar(
      leading: const Icon(
        Icons.arrow_back,
        color: AppColors.black,
      ).withHorizontalPadding(Constants.hp16),
      centerTitle: true,
      title: Text(
        'Course Name',
        style: context.appTheme.bold14.copyWith(
          color: AppColors.black,
        ),
      ),
      actions: [
        const Icon(
          Icons.edit,
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
        'Course Name',
        style: context.appTheme.bold14.copyWith(
          color: AppColors.black,
        ),
      ),
      trailing: const Icon(
        Icons.edit,
        color: AppColors.black,
      ).withHorizontalPadding(Constants.hp16),
    ),
  );
}
