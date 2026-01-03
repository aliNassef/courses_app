import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:courses_app/features/courses/presentation/widgets/all_courses_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/courses_cubit/courses_cubit.dart';

class AllCoursesView extends StatelessWidget {
  const AllCoursesView({super.key, required this.coursesCubit});
  final CoursesCubit coursesCubit;
  static const String routeName = 'all-courses';
  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      body: SafeArea(
        child: BlocProvider.value(
          value: coursesCubit,
          child: const AllCoursesViewBody(),
        ),
      ),
    );
  }
}
