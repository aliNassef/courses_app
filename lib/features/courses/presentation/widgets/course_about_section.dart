import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/translations/locale_keys.g.dart';

class CourseAboutSection extends StatelessWidget {
  const CourseAboutSection({super.key, required this.description});
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.about_this_course.tr(),
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
