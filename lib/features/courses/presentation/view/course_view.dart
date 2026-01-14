import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:courses_app/core/di/service_locator.dart';
import 'package:courses_app/features/courses/presentation/view_model/courses_cubit/courses_cubit.dart';
import 'package:courses_app/features/courses/presentation/widgets/course_app_bar.dart';
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
        child: BlocProvider(
          create: (context) => injector<CoursesCubit>()
            ..getLessonsByCourseIdAndLessonNumber(
              courseArgs.courseId,
              courseArgs.lessonNumber,
            ),
          child: const CourseViewBody(),
        ),
      ),
    );
  }
}
