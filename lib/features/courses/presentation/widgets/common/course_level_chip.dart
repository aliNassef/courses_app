import 'package:courses_app/features/courses/presentation/view_model/courses_category_cubit/courses_category_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/translations/locale_keys.g.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../data/models/course_level_enum.dart';

class CourseLevelChip extends StatefulWidget {
  const CourseLevelChip({
    super.key,
  });

  @override
  State<CourseLevelChip> createState() => _CourseLevelChipState();
}

class _CourseLevelChipState extends State<CourseLevelChip> {
  var selectedChipIndex = 0;

  final List<String> courseLevels = [
    LocaleKeys.all.tr(),
    LocaleKeys.beginner.tr(),
    LocaleKeys.intermediate.tr(),
    LocaleKeys.advanced.tr(),
    LocaleKeys.expert.tr(),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: Constants.hp16),
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, index) => InkWell(
        onTap: () {
          _getCoursesByLevel(index, context);

          setState(() {
            selectedChipIndex = index;
          });
        },
        child: Chip(
          labelStyle: context.appTheme.semiBold12.copyWith(
            color: selectedChipIndex == index
                ? AppColors.white
                : AppColors.black,
          ),
          label: Text(courseLevels[index]),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r),
          ),
          backgroundColor: selectedChipIndex == index
              ? AppColors.primary
              : const Color(0xfff6f7f8),

          side: const BorderSide(color: Colors.transparent),
        ),
      ),
      separatorBuilder: (_, index) => const Gap(10),
      itemCount: courseLevels.length,
    );
  }

  void _getCoursesByLevel(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.read<CoursesCategoryCubit>().onLevelChange(
          CourseLevel.all,
        );
        break;
      case 1:
        context.read<CoursesCategoryCubit>().onLevelChange(
          CourseLevel.beginner,
        );
        break;
      case 2:
        context.read<CoursesCategoryCubit>().onLevelChange(
          CourseLevel.intermediate,
        );
        break;
      case 3:
        context.read<CoursesCategoryCubit>().onLevelChange(
          CourseLevel.advanced,
        );
        break;
      case 4:
        context.read<CoursesCategoryCubit>().onLevelChange(
          CourseLevel.expert,
        );
        break;
    }
  }
}
