import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/widgets.dart';

class CategoryCourseItem extends StatelessWidget {
  const CategoryCourseItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          CustomNetworkImage(
            img:
                'https://tse3.mm.bing.net/th/id/OIP.Wwk-gQuVkQHi8a5qiNXY9AHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',

            height: 80.h,
            width: 100.w,
            radius: 16.r,
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        'data data data data datadatadatadatadata',
                        style: context.appTheme.medium14.copyWith(
                          color: AppColors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Icon(
                      Icons.bookmark,
                      color: AppColors.grey,
                    ),
                  ],
                ),
                Text(
                  'By Ali Nassef',
                  style: context.appTheme.medium12.copyWith(
                    color: AppColors.grey,
                  ),
                ),
                const Gap(10),
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
                      '1000 EGP',
                      style: context.appTheme.bold14.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
