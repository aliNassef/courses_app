import '../../../../core/constants/constants.dart';
import 'instructor_name.dart';
import '../../../my_learning/data/model/my_learning_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/navigation/navigation.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/custom_slider.dart';
import '../../../../core/widgets/widgets.dart';

class ContinuedLearningCardItem extends StatelessWidget {
  const ContinuedLearningCardItem({
    super.key,
    required this.course,
  });
  final MyLearningModel course;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        CourseWatchView.routeName,
        arguments: NavArgs(
          animation: NavAnimation.fade,
          data: CourseArgs(
            courseId: course.courseId,
            lessonNumber: course.completedLessons,
            courseTitle: course.courseTitle,
          ),
        ),
      ),
      child: Card(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              mainAxisAlignment: .start,
              children: [
                CustomNetworkImage(
                  img: course.courseImage,
                  height: 85.h,
                  width: 100.w,
                  radius: 12.r,
                ),
                const Gap(16),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.courseTitle,
                        style: context.appTheme.bold16.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      const Gap(4),
                      Text(
                        course.description,
                        style: context.appTheme.regular14.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      const Gap(4),
                      InstructorName(instructorId: course.instructorId),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(16),
            Row(
              children: [
                Expanded(
                  child: CustomSlider(
                    value: course.progress,
                    onChanged: (value) {},
                  ),
                ),
                const Gap(16),
                Text(
                  '${course.progress.toStringAsFixed(2)}%',
                  style: context.appTheme.bold14.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ],
        ).withAllPadding(Constants.hp16),
      ),
    );
  }
}
