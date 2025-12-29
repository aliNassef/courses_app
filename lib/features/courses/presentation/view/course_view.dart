import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:courses_app/features/courses/presentation/widgets/course_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/course_view_body.dart';

class CourseView extends StatelessWidget {
  const CourseView({super.key});
  static const String routeName = 'course_view';
  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      appBar: buildCourseAppBar(context),
      body: const SafeArea(
        child: CourseViewBody(),
      ),
    );
  }
}
