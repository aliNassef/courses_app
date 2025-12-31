import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/translations/locale_keys.g.dart';
import '../../../../core/utils/utils.dart';

class OrderSummaryPrice extends StatelessWidget {
  const OrderSummaryPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            LocaleKeys.order_summary.tr(),
            style: context.appTheme.bold14,
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                LocaleKeys.sub_total.tr(),
                style: context.appTheme.medium14.copyWith(
                  color: AppColors.grey,
                ),
              ),
              Text(
                '\$10.00',
                style: context.appTheme.medium12.copyWith(
                  color: AppColors.black,
                ),
              ),
            ],
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                LocaleKeys.discount.tr(),
                style: context.appTheme.medium14.copyWith(
                  color: AppColors.grey,
                ),
              ),
              Text(
                '\$10.00',
                style: context.appTheme.medium12.copyWith(
                  color: AppColors.black,
                ),
              ),
            ],
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                LocaleKeys.tax.tr(),
                style: context.appTheme.medium12.copyWith(
                  color: AppColors.grey,
                ),
              ),
              Text(
                '\$10.00',
                style: context.appTheme.medium12.copyWith(
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ],
      ).withAllPadding(Constants.hp16),
    );
  }
}
