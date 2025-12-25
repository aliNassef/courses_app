import 'package:courses_app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/custom_slider.dart';
import '../../../../core/widgets/widgets.dart';

class ContinuedLearningCardItem extends StatelessWidget {
  const ContinuedLearningCardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            mainAxisAlignment: .start,
            children: [
              CustomNetworkImage(
                img:
                    'https://tse3.mm.bing.net/th/id/OIP.Wwk-gQuVkQHi8a5qiNXY9AHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
                height: 85.h,
                width: 100.w,
                radius: 12.r,
              ),
              const Gap(16),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'UI/UX Designer',
                      style: context.appTheme.bold16.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    const Gap(4),
                    Text(
                      'AAAAAAAAAAA AAAAAAAAAAAAAAAAAAAA',
                      style: context.appTheme.regular14.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    const Gap(4),
                    Text(
                      'AAA',
                      style: context.appTheme.regular12.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap(16),
          Row(
            children: [
              const Expanded(
                child: CustomSlider(),
              ),
              const Gap(16),
              Text(
                '40%',
                style: context.appTheme.bold14.copyWith(
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ],
      ).withAllPadding(Constants.hp16),
    );
  }
}
