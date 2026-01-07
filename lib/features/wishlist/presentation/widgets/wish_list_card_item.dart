import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:courses_app/core/extensions/strings_extensions.dart';
import 'package:courses_app/features/courses/data/models/course_model.dart';
import 'package:courses_app/features/home/presentation/widgets/instructor_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/widgets.dart';

class WishListCardItem extends StatelessWidget {
  const WishListCardItem({super.key, required this.course});
  final CourseModel course;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Constants.hp16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          CustomNetworkImage(
            img: course.imageUrl,
            height: 140.h,
            width: context.width,
            radius: 12.r,
          ),
          const Gap(10),
          AdaptiveListTile(
            padding: EdgeInsets.zero,
            title: Text(
              course.title,
              style: context.appTheme.semiBold16,
            ),
            subtitle: course.instructorId.isNullOrEmpty
                ? const SizedBox.shrink()
                : InstructorName(instructorId: course.instructorId),
            trailing: const Icon(
              CupertinoIcons.heart_fill,
              color: AppColors.primary,
            ),
          ),
          const Gap(6),
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
                course.numOfRating.toString(),
                style: context.appTheme.bold10.copyWith(
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                '${course.price} EGP',
                style: context.appTheme.bold16.copyWith(
                  color: AppColors.black,
                ),
              ),
              AdaptiveButton.child(
                color: AppColors.primary,
                onPressed: () {},
                borderRadius: BorderRadius.circular(12),
                child: Text(
                  'Add to Cart',
                  style: context.appTheme.medium14.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
