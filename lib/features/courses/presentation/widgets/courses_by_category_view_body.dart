import 'package:courses_app/core/constants/constants.dart';
import 'package:courses_app/core/extensions/padding_extension.dart';
import 'package:courses_app/core/utils/utils.dart';
import 'package:courses_app/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'category_course_item.dart';
import 'course_level_chip.dart';

class CoursesByCategoryViewBody extends StatelessWidget {
  const CoursesByCategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(5),
        SizedBox(
          height: 40.h,
          child: const CourseLevelChip(),
        ),
        const Divider(),
        Gap(12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'data',
              style: context.appTheme.medium14.copyWith(
                color: AppColors.grey,
              ),
            ),
            const Icon(
              Icons.filter_list_sharp,
              color: AppColors.primary,
            ),
          ],
        ).withHorizontalPadding(Constants.hp16),
        const Gap(16),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(
              horizontal: Constants.hp16,
              vertical: 10.w,
            ),
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: 10,
            itemBuilder: (context, index) {
              return const CategoryCourseItem();
            },
          ),
        ),
      ],
    );
  }
}
