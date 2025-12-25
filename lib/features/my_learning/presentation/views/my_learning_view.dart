import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:courses_app/core/translations/locale_keys.g.dart';
import 'package:courses_app/core/utils/theme/app_theme_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../widgets/my_learning_view_body.dart';

class MyLearningView extends StatelessWidget {
  const MyLearningView({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      appBar: _buildMyLearningAppbar(context),
      body: const SafeArea(
        child: MyLearningViewBody(),
      ),
    );
  }

  AdaptiveAppBar _buildMyLearningAppbar(BuildContext context) {
    return AdaptiveAppBar(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          LocaleKeys.my_learning.tr(),
          style: context.appTheme.semiBold20,
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.bell_fill),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.cart_fill),
          ),
        ],
      ),
      cupertinoNavigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.white,
        middle: Text(
          LocaleKeys.my_learning.tr(),
          style: context.appTheme.semiBold20,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.bell_fill),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.cart_fill),
            ),
          ],
        ),
      ),
    );
  }
}
