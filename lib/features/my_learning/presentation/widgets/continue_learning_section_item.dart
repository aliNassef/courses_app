import 'package:courses_app/core/extensions/duration_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/custom_slider.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../courses/data/models/lesson_model.dart';

class ContinueLearningSectionItem extends StatelessWidget {
  const ContinueLearningSectionItem({super.key, required this.learning});
  final LessonModel learning;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * .7,
      child: Card(
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Stack(
              children: [
                // ThumbnailVideo(
                //   videoUrl: learning.videoUrl,
                //   width: context.width,
                //   height: 100.h,
                //   radius: 8.r,
                // ),
                Positioned(
                  bottom: 6,
                  right: 6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppColors.black.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      learning.duration.toDuration,
                      style: context.appTheme.regular12.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(8),
            Text(
              learning.name,
              style: context.appTheme.semiBold16,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ).withHorizontalPadding(Constants.hp16),
            const Gap(8),
            Text(
              'Lesson 4 aaa',
              style: context.appTheme.regular10.copyWith(
                color: AppColors.grey,
              ),
            ).withHorizontalPadding(Constants.hp16),
            const Gap(16),
            CustomSlider(
              value: 0.4,
              onChanged: (value) {},
            ).withHorizontalPadding(Constants.hp16),
          ],
        ),
      ),
    );
  }
}
