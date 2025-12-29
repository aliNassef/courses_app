import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:courses_app/core/extensions/mediaquery_size.dart';
import 'package:courses_app/core/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CourseEnrollmentBar extends StatelessWidget {
  const CourseEnrollmentBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      width: context.width,
      color: AppColors.white,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\$90.00',
                style: context.appTheme.medium12.copyWith(
                  color: AppColors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Text(
                '\$99.99',
                style: context.appTheme.bold20.copyWith(
                  color: AppColors.black,
                ),
              ),
            ],
          ),
          const Gap(16),
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(12.r),
              ),
              border: Border.all(
                color: AppColors.grey,
              ),
            ),
            child: const Icon(
              CupertinoIcons.cart_fill,
              color: AppColors.black,
              size: 24,
            ),
          ),
          const Gap(16),
          AdaptiveButton.child(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(12.r),
            minSize: Size(context.width * 0.5, 46.r),
            onPressed: () {},
            child: Text(
              'Enroll Now',
              style: context.appTheme.bold16.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
