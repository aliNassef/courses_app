import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/widgets.dart';
import '../../../../my_learning/presentation/view_model/mylearning_cubit/my_leaning_cubit.dart';
import 'course_lessons_list.dart';

class CourseLessonsListBlocBuilder extends StatelessWidget {
  const CourseLessonsListBlocBuilder({
    super.key,
    required this.courseId,
  });

  final String courseId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyLearningCubit, MyLearningState>(
      buildWhen: (previous, current) =>
          current is GetCompletedLessonsIdsLoading ||
          current is GetCompletedLessonsIdsSuccess ||
          current is GetCompletedLessonsIdsError,
      builder: (context, state) {
        if (state is GetCompletedLessonsIdsError) {
          return CustomFailureWidget(meesage: state.failure.errMessage);
        }
        if (state is GetCompletedLessonsIdsLoading) {
          return const SizedBox.shrink();
        }

        if (state is GetCompletedLessonsIdsSuccess) {
          return CourseLessonsList(
            courseId: courseId,
            completedLessonsIds: state.lessonsIds,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
