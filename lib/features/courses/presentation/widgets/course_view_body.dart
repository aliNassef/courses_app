import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:courses_app/core/constants/constants.dart';
import 'package:courses_app/core/extensions/padding_extension.dart';
import 'package:courses_app/core/utils/utils.dart';
import 'package:courses_app/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/di/di.dart';
import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/widgets/custom_switch.dart';
import 'course_lessons_list.dart';
import 'course_video_and_meta_data.dart';

class CourseViewBody extends StatelessWidget {
  const CourseViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<CoursesCubit, CoursesState>(
          buildWhen: (previous, current) =>
              current is GetLessonsByCourseIdAndLessonNumnerLoading ||
              current is GetLessonByCourseIdAndLessonNumnerSuccess ||
              current is GetLessonByCourseIdAndLessonNumnerError,
          builder: (context, state) {
            if (state is GetLessonByCourseIdAndLessonNumnerError) {
              return CustomFailureWidget(meesage: state.failure.errMessage);
            }
            if (state is GetLessonsByCourseIdAndLessonNumnerLoading) {
              return _buildLoadingCourse(context);
            }

            if (state is GetLessonByCourseIdAndLessonNumnerSuccess) {
              return CourseVideoAndMetaData(
                lesson: state.lesson,
              );
            }
            return const SizedBox.shrink();
          },
        ),
        const CourseLessonsList(),
      ],
    );
  }

  Skeletonizer _buildLoadingCourse(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          SizedBox(
            height: context.height * 0.3,
            width: context.width,
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
                  '03. Introduction to UI Design',
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
              ],
            ).withHorizontalPadding(Constants.hp16),
          ),
          const Gap(16),
        ],
      ),
    );
  }
}
