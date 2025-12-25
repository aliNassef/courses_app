import 'package:courses_app/core/extensions/mediaquery_size.dart';
import 'package:courses_app/core/extensions/padding_extension.dart';
import 'package:courses_app/core/utils/app_color.dart';
import 'package:courses_app/core/widgets/custom_network_image.dart';
import 'package:courses_app/core/widgets/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants.dart';
import '../../../../core/translations/locale_keys.g.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/custom_slider.dart';
import '../../../../core/widgets/title_with_see_all.dart';

class MyLearningViewBody extends StatelessWidget {
  const MyLearningViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height,
      color: AppColors.white,
      child: Column(
        children: [
          const Divider(),
          const Gap(16),
          TitleWithSeeAll(
            title: LocaleKeys.continue_learning.tr(),
            hasIcon: false,
          ).withHorizontalPadding(Constants.hp16),
          const Gap(16),
          SizedBox(height: 200.h, child: const ContinueLearningSection()),
        ],
      ),
    );
  }
}

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

class ContinueLearningSectionItem extends StatelessWidget {
  const ContinueLearningSectionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * .7,
      child: Card(
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Stack(
              children: [
                CustomNetworkImage(
                  img:
                      'https://tse3.mm.bing.net/th/id/OIP.Wwk-gQuVkQHi8a5qiNXY9AHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
                  width: context.width,
                  height: 100.h,
                  radius: 8.r,
                ),
                Positioned(
                  bottom: 6,
                  right: 6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppColors.black.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      "12:50",
                      style: context.appTheme.regular12.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(8),
            Text(
              'Flutter Flutter ',
              style: context.appTheme.semiBold16,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ).withHorizontalPadding(Constants.hp16),
            const Gap(8),
            Text(
              'Lesson 4 aaa',
              style: context.appTheme.regular10.copyWith(
                color: AppColors.grey,
              ),
            ).withHorizontalPadding(Constants.hp16),
            const Gap(16),
            const CustomSlider().withHorizontalPadding(Constants.hp16),
          ],
        ),
      ),
    );
  }
}
