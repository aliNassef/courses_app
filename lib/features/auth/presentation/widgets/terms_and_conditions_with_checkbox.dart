import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
              text: 'By creating an account, you agree to our ',
              style: context.appTheme.bold12.copyWith(
                color: AppColors.grey,
              ),
              children: [
                TextSpan(
                  text: 'Terms and Conditions',
                  style: context.appTheme.bold12.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                TextSpan(
                  text: ' and ',
                  style: context.appTheme.bold12.copyWith(
                    color: AppColors.grey,
                  ),
                ),
                TextSpan(
                  text: 'Privacy Policy',
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
