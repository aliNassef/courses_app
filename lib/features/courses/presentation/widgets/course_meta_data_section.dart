import 'package:courses_app/core/constants/constants.dart';
import 'package:courses_app/core/extensions/padding_extension.dart';
import 'package:courses_app/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/extensions/duration_extension.dart';
import '../../data/models/course_model.dart';
import 'instructor_info.dart';

class CourseMetaDataSection extends StatelessWidget {
  const CourseMetaDataSection({super.key, required this.course});
  final CourseModel course;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(16),
        Row(
          mainAxisAlignment: .spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                course.title,
                style: context.appTheme.bold20.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
            const Icon(
              Icons.bookmark_add,
              color: AppColors.grey,
            ),
          ],
        ).withHorizontalPadding(Constants.hp16),
        const Gap(16),
        Row(
          spacing: 4.w,
          children: [
            const Icon(
              Icons.star,
              color: Color(0xffeab308),
              size: 16,
            ),
            Text(
              course.rating.toString(),
              style: context.appTheme.bold10,
            ),
            Text(
              '(1.2k)',
              style: context.appTheme.bold10.copyWith(
                color: AppColors.grey,
              ),
            ),
            const Gap(8),
            const Icon(
              Icons.people_sharp,
              color: AppColors.grey,
            ),
            Text(
              '${course.subscribersCount} Students',
              style: context.appTheme.regular12.copyWith(
                color: AppColors.grey,
              ),
            ),
          ],
        ).withHorizontalPadding(Constants.hp16),
        const Gap(16),
        Row(
          children: [
            const Icon(
              Icons.watch_later,
              color: AppColors.grey,
            ),
            const Gap(8),
            Text(
              course.duration.toHours,
              style: context.appTheme.regular14.copyWith(
                color: AppColors.grey,
              ),
            ),
          ],
        ).withHorizontalPadding(Constants.hp16),
        const Gap(16),
        const InstructorInfo(),
      ],
    );
  }
}
