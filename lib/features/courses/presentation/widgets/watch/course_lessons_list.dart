import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/widgets/custom_failure_widget.dart';
import '../../../data/models/lesson_model.dart';
import '../../view_model/course_watch_cubit/course_watch_cubit.dart';
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
    context.read<CourseWatchCubit>().getLessonsByCourseId(widget.courseId);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CourseWatchCubit, CourseWatchState>(
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
                    context
                        .read<CourseWatchCubit>()
                        .getLessonsByCourseIdAndLessonNumber(
                          widget.courseId,
                          state.lessons[index].order,
                        );
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
              description:
                  'industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic',
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
