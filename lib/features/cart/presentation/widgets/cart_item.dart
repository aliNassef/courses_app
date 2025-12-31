import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/widgets.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Row(
        children: [
          CustomNetworkImage(
            img:
                'https://tse3.mm.bing.net/th/id/OIP.Wwk-gQuVkQHi8a5qiNXY9AHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',

            height: 85.h,
            width: 100.w,
            radius: 12.r,
          ),
          Gap(Constants.hp16),
          Expanded(
            child: Column(
              mainAxisAlignment: .start,
              crossAxisAlignment: .start,
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        'AAAAAAAAAAAAAAA',
                        style: context.appTheme.bold16,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    const Icon(
                      CupertinoIcons.delete_solid,
                      color: AppColors.grey,
                      size: 20,
                    ),
                  ],
                ),
                const Gap(8),
                Text(
                  'AA',
                  style: context.appTheme.regular14.copyWith(
                    color: AppColors.grey,
                  ),
                ),
                const Gap(8),
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.star_fill,
                      color: Color(0xffFFC107),
                      size: 16,
                    ),
                    const Gap(8),
                    Text(
                      '4.5',
                      style: context.appTheme.regular14.copyWith(
                        color: const Color(0xffFFC107),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '\$49.99',
                      style: context.appTheme.bold16.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ).withHorizontalPadding(12.w).withVerticalPadding(10.h),
    );
  }
}
