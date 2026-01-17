import '../../../../../core/constants/constants.dart';
import '../../../../../core/extensions/padding_extension.dart';
import '../../../../../core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/translations/locale_keys.g.dart';

import '../../../../../core/di/service_locator.dart';
import '../../../data/models/course_model.dart';
import '../../../../../core/extensions/duration_extension.dart';
import '../../view_model/instructor_cubit/instructor_cubit.dart';
import '../common/instructor_info.dart';

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
              '(${course.numOfRating})',
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
              '${course.subscribersCount} ${LocaleKeys.students.tr()}',
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
        BlocProvider(
          create: (context) =>
              injector<InstructorCubit>()
                ..getInstructorInfo(course.instructorId),
          child: const InstructorInfo(),
        ),
      ],
    );
  }
}
