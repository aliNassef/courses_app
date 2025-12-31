import 'package:courses_app/core/constants/constants.dart';
import 'package:courses_app/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/custom_slider.dart';
import '../../../../core/widgets/widgets.dart';

class InProgreeCardItem extends StatelessWidget {
  const InProgreeCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Row(
        children: [
          CustomNetworkImage(
            img:
                'https://tse3.mm.bing.net/th/id/OIP.Wwk-gQuVkQHi8a5qiNXY9AHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
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
                  'Flutter',
                  style: context.appTheme.bold16,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const Gap(8),
                Text(
                  'Flutter',
                  style: context.appTheme.regular12.copyWith(
                    color: AppColors.grey,
                  ),
                ),
                const Gap(8),
                Row(
                  children: [
                    const CustomSlider(),
                    const Gap(12),
                    Text('40%', style: context.appTheme.bold10),
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
