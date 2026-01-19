import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/translations/locale_keys.g.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/custom_network_image.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../../home/presentation/widgets/instructor_name.dart';
import '../../../data/models/course_model.dart';

class CategoryCourseItem extends StatelessWidget {
  const CategoryCourseItem({
    super.key,
    required this.course,
  });
  final CourseModel course;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          CustomNetworkImage(
            img: course.imageUrl,
            height: 80.h,
            width: 100.w,
            radius: 16.r,
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        course.title,
                        style: context.appTheme.medium14.copyWith(
                          color: AppColors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Gap(8),
                    const Icon(
                      Icons.bookmark,
                      color: AppColors.grey,
                    ),
                  ],
                ),
                const Gap(8),
                InstructorName(instructorId: course.instructorId),
                const Gap(10),
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.star_fill,
                      color: Color(0xffFFC107),
                      size: 16,
                    ),
                    const Gap(8),
                    Text(
                      course.rating.toString(),
                      style: context.appTheme.regular14.copyWith(
                        color: const Color(0xffFFC107),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${course.price} ${LocaleKeys.egp.tr()}',
                      style: context.appTheme.bold14.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
