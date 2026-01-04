import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';

import '../../data/models/course_model.dart';
import '../widgets/course_details_app_bar.dart';
import '../widgets/course_details_view_body.dart';

class CourseDetailsView extends StatelessWidget {
  const CourseDetailsView({required this.course, super.key});
  static const String routeName = 'course-details';
  final CourseModel course;
  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      appBar: buildCourseDetailsAppBar(context),
      body: SafeArea(
        child: CourseDetailsViewBody(
          course: course,
        ),
      ),
    );
  }
}
