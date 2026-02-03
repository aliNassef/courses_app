import '../../../../../core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/di.dart';
import '../../view_model/course_watch_cubit/course_watch_cubit.dart';
import 'course_lessons_list_bloc_builder.dart';
import 'course_video_and_meta_data.dart';
import 'course_watch_loading_skeleton.dart';

class CourseWatchViewBody extends StatelessWidget {
  const CourseWatchViewBody({super.key, required this.courseId});
  final String courseId;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BlocBuilder<CourseWatchCubit, CourseWatchState>(
            buildWhen: (previous, current) =>
                current is GetSpecificLessonLoading ||
                current is GetSpecificLessonSuccess ||
                current is GetSpecificLessonError,
            builder: (context, state) {
              if (state is GetSpecificLessonError) {
                return CustomFailureWidget(meesage: state.failure.errMessage);
              }
              if (state is GetSpecificLessonLoading) {
                return const CourseWatchLoadingSkeleton();
              }

              if (state is GetSpecificLessonSuccess) {
                return CourseVideoAndMetaData(
                  lesson: state.lesson,
                  courseId: courseId,
                );
              }
              return const SizedBox.shrink();
            },
          ),
          CourseLessonsListBlocBuilder(courseId: courseId),
        ],
      ),
    );
  }
}
