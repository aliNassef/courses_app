import 'package:courses_app/core/utils/utils.dart';
import 'package:courses_app/core/widgets/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CourseAboutSection extends StatelessWidget {
  const CourseAboutSection({super.key});

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
        const ExpandableText(
          text:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. consectetur adipiscing elit. consectetur adipiscing elit. consectetur adipiscing elit. consectetur adipiscing elit. consectetur adipiscing elit. consectetur adipiscing elit. consectetur adipiscing elit. consectetur adipiscing elit. consectetur adipiscing elit. consectetur adipiscing elit. consectetur adipiscing elit. Nullam nec metus vel ante ultricies facilisis. Nullam nec metus vel ante ultricies facilisis. Nullam nec metus vel ante ultricies facilisis.',
        ),
      ],
    );
  }
}
