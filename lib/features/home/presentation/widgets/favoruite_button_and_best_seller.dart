import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/translations/locale_keys.g.dart';
import '../../../../core/utils/utils.dart';
import 'explore_course_card_item.dart';

class FavoruiteButtonAndBestSeller extends StatelessWidget {
  const FavoruiteButtonAndBestSeller({
    super.key,
    required this.widget,
  });

  final ExploreCourseCardItem widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Visibility(
          visible: widget.course.bestSeller,
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
    );
  }
}
