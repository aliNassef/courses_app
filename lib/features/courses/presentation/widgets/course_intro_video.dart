import 'package:courses_app/core/utils/utils.dart';
import 'package:courses_app/core/extensions/mediaquery_size.dart';
import 'package:flutter/material.dart';

class CourseIntroVideo extends StatelessWidget {
  const CourseIntroVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.3,
      width: context.width,
      color: AppColors.orange,
    );
  }
}
