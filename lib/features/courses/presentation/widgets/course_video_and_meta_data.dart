import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/duration_extension.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/custom_switch.dart';
import '../../../../core/widgets/widgets.dart';
import '../../data/models/lesson_model.dart';
import 'course_intro_video.dart';
import 'tabs_lessons_notes_discuss.dart';

class CourseVideoAndMetaData extends StatelessWidget {
  const CourseVideoAndMetaData({
    super.key,
    required this.lesson,
  });
  final LessonModel lesson;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        CourseIntroVideo(
          videoUrl: lesson.videoUrl,
        ),
        DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.white,
          ),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              const Gap(20),
              Text(
                lesson.name,
                style: context.appTheme.bold20.copyWith(
                  color: AppColors.black,
                ),
              ),
              const Gap(10),
              Row(
                children: [
                  const Icon(
                    Icons.watch_later,
                    color: AppColors.grey,
                  ),
                  const Gap(5),
                  Text(
                    lesson.duration.toHours,
                    style: context.appTheme.regular14.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                  Text(
                    '  -  ',
                    style: context.appTheme.bold20.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                  const Gap(5),
                  Text(
                    'In Progress',
                    style: context.appTheme.regular14.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              const Gap(20),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: AppColors.grey.withValues(alpha: 0.2),
                  ),
                ),
                child: AdaptiveListTile(
                  title: Text(
                    'Mark as Completed',
                    style: context.appTheme.bold16.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  subtitle: Text(
                    'track your progress',
                    style: context.appTheme.regular14.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                  trailing: const CustomSwitch(),
                ),
              ),
              const Gap(25),
              const TabsLessonsNotesDiscuss(),
            ],
          ).withHorizontalPadding(Constants.hp16),
        ),
        const Gap(16),
      ],
    );
  }
}
