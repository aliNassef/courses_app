import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/extensions/mediaquery_size.dart';
import '../../../../../core/extensions/padding_extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/custom_switch.dart';
import '../../../../../core/widgets/widgets.dart';

class CourseWatchLoadingSkeleton extends StatelessWidget {
  const CourseWatchLoadingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: context.height * 0.3,
            width: context.width,
          ),
          DecoratedBox(
            decoration: const BoxDecoration(
              color: AppColors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(20),
                Text(
                  '03. Introduction to UI Design',
                  style: context.appTheme.bold20.copyWith(
                    color: AppColors.black,
                  ),
                ),
                const Gap(10),
                Row(
                  children: [
                    const Icon(
                      Icons.watch_later,
                      color: AppColors.grey,
                    ),
                    const Gap(5),
                    Text(
                      '2 min 30 sec',
                      style: context.appTheme.regular14.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                    Text(
                      '  -  ',
                      style: context.appTheme.bold20.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                    const Gap(5),
                    Text(
                      'In Progress',
                      style: context.appTheme.regular14.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                const Gap(20),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: AppColors.grey.withValues(alpha: 0.2),
                    ),
                  ),
                  child: AdaptiveListTile(
                    title: Text(
                      'Mark as Completed',
                      style: context.appTheme.bold16.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    subtitle: Text(
                      'track your progress',
                      style: context.appTheme.regular14.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                    trailing: const CustomSwitch(
                      value: false,
                    ),
                  ),
                ),
              ],
            ).withHorizontalPadding(Constants.hp16),
          ),
          const Gap(16),
        ],
      ),
    );
  }
}
