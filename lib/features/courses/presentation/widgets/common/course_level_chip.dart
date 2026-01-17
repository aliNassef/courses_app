import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/widgets.dart';

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
    'All',
    'Beginner',
    'Intermediate',
    'Advanced',
    'Expert',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: Constants.hp16),
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, index) => InkWell(
        onTap: () {
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
}
