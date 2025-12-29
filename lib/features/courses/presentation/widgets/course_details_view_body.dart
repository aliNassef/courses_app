import 'package:courses_app/features/courses/presentation/widgets/course_enrollment_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/utils/utils.dart';
import 'course_about_section.dart';
import 'course_intro_video.dart';
import 'course_learning_outcomes_section.dart';
import 'course_meta_data_section.dart';

class CourseDetailsViewBody extends StatelessWidget {
  const CourseDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CourseIntroVideo(),
              Container(
                color: AppColors.white,
                child: const CourseMetaDataSection(),
              ),
              const Gap(16),
              Container(
                color: AppColors.white,
                padding: EdgeInsets.symmetric(
                  vertical: Constants.hp16,
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CourseAboutSection(),
                    Gap(16),
                    CourseLearningOutcomesSection(),
                  ],
                ).withHorizontalPadding(Constants.hp16),
              ),
            ],
          ),
        ),
        const Positioned(
          bottom: 0,
          child: CourseEnrollmentBar(),
        ),
      ],
    );
  }
}
