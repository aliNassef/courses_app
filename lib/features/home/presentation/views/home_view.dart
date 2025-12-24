import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:courses_app/core/constants.dart';
import 'package:courses_app/core/extensions/padding_extension.dart';
import 'package:courses_app/core/utils/theme/app_theme_extension.dart';
import 'package:courses_app/core/widgets/custom_search_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/translations/locale_keys.g.dart';
import '../widgets/user_info.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      body: Column(
        crossAxisAlignment: .start,
        children: [
          const UserInfo(),
          const Gap(16),
          const CustomSearchBar(),
          const Gap(30),
          Text(
            LocaleKeys.continue_learning.tr(),
            style: context.appTheme.bold20,
          ),
          const Gap(16),
        ],
      ).withHorizontalPadding(Constants.hp16),
    );
  }
}
