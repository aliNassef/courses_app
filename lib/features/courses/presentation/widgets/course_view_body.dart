import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:courses_app/core/constants/constants.dart';
import 'package:courses_app/core/extensions/padding_extension.dart';
import 'package:courses_app/core/utils/utils.dart';
import 'package:courses_app/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/widgets/custom_switch.dart';
import 'course_lesson_card.dart';
import 'tabs_lessons_notes_discuss.dart';

class CourseViewBody extends StatelessWidget {
  const CourseViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        // const CourseIntroVideo(),
        DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.white,
          ),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              const Gap(20),
              Text(
                '03. Introduction to UI Design',
                style: context.appTheme.bold20.copyWith(color: AppColors.black),
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
                    '2 min 30 sec',
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
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: Constants.hp16),
            itemBuilder: (context, index) {
              return const CourseLessonCard();
            },
            separatorBuilder: (context, index) {
              return const Gap(16);
            },
            itemCount: 10,
          ),
        ),
        const Gap(16),
      ],
    );
  }
}
