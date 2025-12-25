import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../translations/locale_keys.g.dart';
import '../utils/utils.dart';

class TitleWithSeeAll extends StatelessWidget {
  const TitleWithSeeAll({
    super.key,
    required this.title,
    this.hasIcon = true,
  });
  final String title;
  final bool hasIcon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(
          title,
          style: context.appTheme.bold20,
        ),
        Row(
          children: [
            Text(
              LocaleKeys.see_all.tr(),
              style: context.appTheme.bold16.copyWith(
                color: AppColors.primary,
              ),
            ),
            hasIcon
                ? const Icon(
                    Icons.arrow_forward,
                    color: AppColors.primary,
                    size: 19,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}
