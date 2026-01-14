import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import '../../../../core/extensions/duration_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/widgets.dart';
import '../../data/models/lesson_model.dart';

class CourseLessonCard extends StatelessWidget {
  const CourseLessonCard({super.key, required this.lesson});
  final LessonModel lesson;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: AdaptiveListTile(
        title: Text(
          lesson.name,
          style: context.appTheme.bold16.copyWith(
            color: AppColors.black,
          ),
        ),
        subtitle: Text(
          lesson.duration.toHM,
          style: context.appTheme.regular14.copyWith(
            color: AppColors.grey,
          ),
        ),
        leading: CircleAvatar(
          backgroundColor: const Color(0xffe7f2fd),
          child: lesson.isFree
              ? const Icon(
                  Icons.check,
                  color: AppColors.primary,
                  size: 18,
                )
              : const Icon(
                  Icons.lock,
                  color: AppColors.primary,
                  size: 18,
                ),
        ),
      ),
    );
  }
}
