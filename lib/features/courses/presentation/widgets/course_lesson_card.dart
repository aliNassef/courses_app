import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/widgets.dart';

class CourseLessonCard extends StatelessWidget {
  const CourseLessonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: AdaptiveListTile(
        title: Text(
          'Lesson 1',
          style: context.appTheme.bold16.copyWith(
            color: AppColors.black,
          ),
        ),
        subtitle: Text(
          'Introduction to UI Design',
          style: context.appTheme.regular14.copyWith(
            color: AppColors.grey,
          ),
        ),
        leading: const CircleAvatar(
          backgroundColor: Color(0xffe7f2fd),
          child: Icon(
            Icons.check,
            color: AppColors.primary,
            size: 18,
          ),
        ),
      ),
    );
  }
}
