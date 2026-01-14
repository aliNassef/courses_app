import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:courses_app/core/di/service_locator.dart';
import 'package:courses_app/features/courses/presentation/view_model/courses_cubit/courses_cubit.dart';
import 'package:courses_app/features/courses/presentation/widgets/course_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/course_view_body.dart';

class CourseView extends StatelessWidget {
  const CourseView({super.key});
  static const String routeName = 'course_view';
  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      appBar: buildCourseAppBar(context),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => injector<CoursesCubit>()
            ..getLessonsByCourseIdAndLessonNumber('FqYm0B33vjXLJHggr3Cs', 1),
          child: const CourseViewBody(),
        ),
      ),
    );
  }
}
