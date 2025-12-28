

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/widgets.dart';

class RecentAchivementItem extends StatelessWidget {
  const RecentAchivementItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.4,
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundImage: const AssetImage(AppAssets.profile),
          ),
          const Gap(16),
          Flexible(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  'Fast Learner',
                  style: context.appTheme.bold14.copyWith(
                    color: AppColors.black,
                  ),
                ),
                Text(
                  'Fast Learner',
                  style: context.appTheme.regular12.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
