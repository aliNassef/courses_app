import 'package:courses_app/core/utils/utils.dart';
import 'package:courses_app/core/widgets/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CourseAboutSection extends StatelessWidget {
  const CourseAboutSection({super.key, required this.description});
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About This Course',
          style: context.appTheme.bold16,
        ),
        const Gap(8),
        ExpandableText(
          text: description,
        ),
      ],
    );
  }
}
