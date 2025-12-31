import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/logging/app_logger.dart';
import '../../../../core/translations/locale_keys.g.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/widgets.dart';

class TotalPriceAndCheckoutButton extends StatelessWidget {
  const TotalPriceAndCheckoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height * 0.2,
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            LocaleKeys.total_price.tr(),
            style: context.appTheme.medium12.copyWith(
              color: AppColors.grey,
            ),
          ),
          Text(
            '\$100',
            style: context.appTheme.bold20.copyWith(
              color: AppColors.black,
            ),
          ),
          const Gap(16),
          AdaptiveButton.child(
            color: AppColors.primary,
            minSize: Size(context.width, kToolbarHeight),
            size: AdaptiveButtonSize.large,
            borderRadius: BorderRadius.circular(12.r),
            onPressed: () {
              AppLogger.info('message');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.proceed_to_checkout.tr(),
                  style: context.appTheme.bold16.copyWith(
                    color: AppColors.white,
                  ),
                ),
                const Gap(8),
                const Icon(
                  Icons.arrow_forward,
                  color: AppColors.white,
                ),
              ],
            ),
          ),
        ],
      ).withVerticalPadding(10.h).withHorizontalPadding(Constants.hp16),
    );
  }
}
