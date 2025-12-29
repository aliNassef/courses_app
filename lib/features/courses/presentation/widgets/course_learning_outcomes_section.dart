import 'package:courses_app/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CourseLearningOutcomesSection extends StatelessWidget {
  const CourseLearningOutcomesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: const BoxDecoration(
        color: Color(0xfff3f8fe),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What You Will Learn',
            style: context.appTheme.bold16,
          ),
          const Gap(16),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            separatorBuilder: (context, index) {
              return const Gap(16);
            },
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(2.r),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary,
                    ),
                    child: Icon(
                      Icons.check,
                      color: AppColors.white,
                      size: 14.r,
                    ),
                  ),
                  const Gap(8),
                  Flexible(
                    child: Text(
                      'Lorem ipsum dolor sit amet,  .',
                      style: context.appTheme.medium12.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
