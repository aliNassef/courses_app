import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:courses_app/core/widgets/custom_network_image.dart';
import 'package:gap/gap.dart';

import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/translations/locale_keys.g.dart';
import '../../../../core/utils/utils.dart';
import '../../../courses/data/models/course_model.dart';

class ExploreCourseCardItem extends StatelessWidget {
  const ExploreCourseCardItem({super.key, required this.course});
  final CourseModel course;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: .start,
            children: [
              CustomNetworkImage(
                img: course.imageUrl,
                height: 140.h,
                width: context.width,
                topStartRadius: 12.r,
                topEndRadius: 12.r,
              ),
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
                    '4.5',
                    style: context.appTheme.bold10,
                  ),
                  Text(
                    '(1.2k)',
                    style: context.appTheme.bold10.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ).withHorizontalPadding(10),
              const Gap(8),
              Text(
                course.title,
                style: context.appTheme.bold16,
              ).withHorizontalPadding(10),
              const Gap(8),
              Text(
                'Ali Nassef',
                style: context.appTheme.regular12.copyWith(
                  color: AppColors.grey,
                ),
              ).withHorizontalPadding(10),
              const Gap(16),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    '${course.price} EGP',
                    style: context.appTheme.bold16.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xffe7f2fd),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: AppColors.primary,
                      size: 24,
                    ),
                  ),
                ],
              ).withHorizontalPadding(10),
              const Gap(8),
            ],
          ),

          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Visibility(
                visible: course.bestSeller,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.white.withValues(alpha: 0.85),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Text(
                    LocaleKeys.best_sellers.tr(),
                    style: context.appTheme.medium14.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const CircleAvatar(
                  backgroundColor: AppColors.primary,
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ).withAllPadding(10.r),
        ],
      ),
    );
  }
}
