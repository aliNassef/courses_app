import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/translations/locale_keys.g.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/custom_check_box.dart';

class TermsAndConditionsWithCheckBox extends StatelessWidget {
  const TermsAndConditionsWithCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: .start,
      children: [
        const CustomCheckBox(),
        const Gap(12),
        Flexible(
          child: RichText(
            text: TextSpan(
              text: LocaleKeys.terms_agreement_start.tr(),
              style: context.appTheme.bold12.copyWith(
                color: AppColors.grey,
              ),
              children: [
                TextSpan(
                  text: LocaleKeys.terms_and_conditions.tr(),
                  style: context.appTheme.bold12.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                TextSpan(
                  text: LocaleKeys.and.tr(),
                  style: context.appTheme.bold12.copyWith(
                    color: AppColors.grey,
                  ),
                ),
                TextSpan(
                  text: LocaleKeys.privacy_policy.tr(),
                  style: context.appTheme.bold12.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
