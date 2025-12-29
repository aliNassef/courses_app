import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';

import '../widgets/course_details_app_bar.dart';
import '../widgets/course_details_view_body.dart';

class CourseDetailsView extends StatelessWidget {
  const CourseDetailsView({super.key});
  static const String routeName = 'course-details';
  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      appBar: buildCourseDetailsAppBar(context),
      body: const SafeArea(
        child: CourseDetailsViewBody(),
      ),
    );
  }
}
