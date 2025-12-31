import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/constants.dart';
import 'continue_learning_section_item.dart';

class ContinueLearningSection extends StatelessWidget {
  const ContinueLearningSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: Constants.hp16),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return const ContinueLearningSectionItem();
      },
      separatorBuilder: (context, index) {
        return const Gap(8);
      },
      itemCount: 5,
    );
  }
}
