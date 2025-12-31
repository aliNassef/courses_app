import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/widgets.dart';

class WishListCardItem extends StatelessWidget {
  const WishListCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Constants.hp16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          CustomNetworkImage(
            img:
                'https://tse3.mm.bing.net/th/id/OIP.Wwk-gQuVkQHi8a5qiNXY9AHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
            height: 140.h,
            width: context.width,
            radius: 12.r,
          ),
          const Gap(10),
          AdaptiveListTile(
            padding: EdgeInsets.zero,
            title: Text(
              'Introducing to Flutter',
              style: context.appTheme.semiBold16,
            ),
            subtitle: Text(
              'by Google',
              style: context.appTheme.regular12.copyWith(
                color: AppColors.grey,
              ),
            ),
            trailing: const Icon(
              CupertinoIcons.heart_fill,
              color: AppColors.primary,
            ),
          ),
          const Gap(6),
          Row(
            spacing: 4.w,
            children: [
              const Icon(
                Icons.star,
                color: Color(0xffeab308),
                size: 16,
              ),
              Text(
                '4.5',
                style: context.appTheme.bold10,
              ),
              Text(
                '(1.2k)',
                style: context.appTheme.bold10.copyWith(
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                '\$100',
                style: context.appTheme.bold16.copyWith(
                  color: AppColors.black,
                ),
              ),
              AdaptiveButton.child(
                color: AppColors.primary,
                onPressed: () {},
                borderRadius: BorderRadius.circular(12),
                child: Text(
                  'Add to Cart',
                  style: context.appTheme.medium14.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
