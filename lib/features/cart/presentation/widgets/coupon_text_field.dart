import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/widgets.dart';

class CouponTextField extends StatelessWidget {
  const CouponTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AdaptiveTextField(
      style: context.appTheme.regular14.copyWith(
        color: AppColors.primary,
      ),
      decoration: InputDecoration(
        hintText: 'Enter coupon code',
        fillColor: AppColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(
            color: AppColors.primary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(
            color: AppColors.primary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(
            color: AppColors.grey,
          ),
        ),
        filled: true,
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 30.h,
              width: 1,
              color: AppColors.grey,
            ),
            Gap(10.w),
            Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  backgroundColor: AppColors.primary.withValues(
                    alpha: 0.2,
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Apply',
                  style: context.appTheme.medium14.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
