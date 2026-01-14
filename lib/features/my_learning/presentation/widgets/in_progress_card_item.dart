import 'package:courses_app/core/constants/constants.dart';
import 'package:courses_app/core/extensions/padding_extension.dart';
import 'package:courses_app/features/home/presentation/widgets/instructor_name.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/custom_slider.dart';
import '../../../../core/widgets/widgets.dart';
import '../../data/model/my_learning_model.dart';

class InProgreeCardItem extends StatelessWidget {
  const InProgreeCardItem({super.key, required this.learning});
  final MyLearningModel learning;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Row(
        children: [
          CustomNetworkImage(
            img: learning.courseImage,
            height: 80.h,
            width: 100.w,
            radius: 12.r,
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .spaceAround,
              children: [
                Text(
                  learning.courseTitle,
                  style: context.appTheme.bold16,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const Gap(8),
                InstructorName(instructorId: learning.instructorId),
                const Gap(8),
                Row(
                  children: [
                    CustomSlider(
                      value: learning.progress,
                      onChanged: (value) {},
                    ),
                    const Gap(12),
                    Text(
                      '${learning.progress}%',
                      style: context.appTheme.bold10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ).withAllPadding(Constants.hp16),
    );
  }
}
