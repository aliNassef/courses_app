import 'course_enrollment_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/extensions/padding_extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../data/models/course_model.dart';
import 'course_about_section.dart';
import '../common/course_intro_video.dart';
import 'course_learning_outcomes_section.dart';
import 'course_meta_data_section.dart';

class CourseDetailsViewBody extends StatelessWidget {
  const CourseDetailsViewBody({super.key, required this.course});
  final CourseModel course;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 65.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CourseIntroVideo(videoUrl: course.introVideoUrl),
                Container(
                  color: AppColors.white,
                  child: CourseMetaDataSection(course: course),
                ),
                const Gap(16),
                Container(
                  color: AppColors.white,
                  padding: EdgeInsets.symmetric(
                    vertical: Constants.hp16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CourseAboutSection(description: course.description),
                      const Gap(16),
                      CourseLearningOutcomesSection(
                        learningOutcomes: course.objectives,
                      ),
                    ],
                  ).withHorizontalPadding(Constants.hp16),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: CourseEnrollmentBar(
            course: course,
          ),
        ),
      ],
    );
  }
}
