import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:courses_app/core/di/di.dart';
import '../../../../core/di/service_locator.dart';
import '../../../my_learning/presentation/view_model/mylearning_cubit/my_leaning_cubit.dart';
import '../widgets/course_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/course_args.dart';
import '../widgets/course_view_body.dart';

class CourseView extends StatelessWidget {
  const CourseView({super.key, required this.courseArgs});
  static const String routeName = 'course_view';
  final CourseArgs courseArgs;
  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      appBar: buildCourseAppBar(context, courseArgs.courseTitle),
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  injector<CoursesCubit>()..getLessonsByCourseIdAndLessonNumber(
                    courseArgs.courseId,
                    courseArgs.lessonNumber,
                  ),
            ),
            BlocProvider(
              create: (context) => injector<MyLearningCubit>()..getCompletedLessonsIds(
                userId: context.read<AuthCubit>().userId,
                courseId: courseArgs.courseId,
              ),
            ),
          ],
          child: CourseViewBody(courseId: courseArgs.courseId),
        ),
      ),
    );
  }
}
