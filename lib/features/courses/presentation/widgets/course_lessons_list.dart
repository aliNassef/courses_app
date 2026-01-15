import '../../../../core/utils/app_dilagos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/di/di.dart';
import '../../../../core/widgets/custom_failure_widget.dart';
import '../../data/models/lesson_model.dart';
import 'course_lesson_card.dart';

class CourseLessonsList extends StatefulWidget {
  const CourseLessonsList({
    super.key,
    required this.courseId,
    required this.completedLessonsIds,
  });
  final String courseId;
  final Set<String> completedLessonsIds;
  @override
  State<CourseLessonsList> createState() => _CourseLessonsListState();
}

class _CourseLessonsListState extends State<CourseLessonsList> {
  @override
  void initState() {
    super.initState();
    context.read<CoursesCubit>().getLessonsByCourseId(widget.courseId);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CoursesCubit, CoursesState>(
        buildWhen: (previous, current) =>
            current is GetLessonsByCourseIdSuccess ||
            current is GetLessonsByCourseIdError ||
            current is GetLessonsByCourseIdLoading,
        builder: (context, state) {
          if (state is GetLessonsByCourseIdLoading) {
            return _buildLoadingCourseLesson();
          }

          if (state is GetLessonsByCourseIdError) {
            return CustomFailureWidget(
              meesage: state.failure.errMessage,
            );
          }
          if (state is GetLessonsByCourseIdSuccess) {
            return ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: Constants.hp16,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (state.lessons[index].isCompleted) {
                      context
                          .read<CoursesCubit>()
                          .getLessonsByCourseIdAndLessonNumber(
                            widget.courseId,
                            state.lessons[index].order,
                          );
                    } else {
                      AppDilagos.showToast(
                        text: 'Please Enroll in the course first',
                      );
                    }
                  },
                  child: CourseLessonCard(
                    isCompleted: widget.completedLessonsIds.contains(
                      state.lessons[index].id,
                    ),
                    lesson: state.lessons[index],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Gap(16);
              },
              itemCount: state.lessons.length,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Skeletonizer _buildLoadingCourseLesson() {
    return Skeletonizer(
      enabled: true,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: Constants.hp16,
        ),
        itemBuilder: (context, index) {
          return CourseLessonCard(
            isCompleted: false,
            lesson: LessonModel(
              id: '2',
              name: "Ali Nassef",
              videoUrl: "",
              duration: 40,
              order: 1,
              isCompleted: true,
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Gap(16);
        },
        itemCount: 10,
      ),
    );
  }
}
