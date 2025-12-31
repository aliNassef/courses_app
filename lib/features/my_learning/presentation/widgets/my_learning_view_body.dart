import 'package:courses_app/core/extensions/mediaquery_size.dart';
import 'package:courses_app/core/extensions/padding_extension.dart';
import 'package:courses_app/core/widgets/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/translations/locale_keys.g.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/title_with_see_all.dart';
import 'continue_learning_section.dart';
import 'in_progress_card_item.dart';

class MyLearningViewBody extends StatelessWidget {
  const MyLearningViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height,
      color: AppColors.white,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                const Divider(),
                const Gap(16),
                TitleWithSeeAll(
                  title: LocaleKeys.continue_learning.tr(),
                  hasIcon: false,
                ).withHorizontalPadding(Constants.hp16),
                const Gap(16),
                SizedBox(height: 200.h, child: const ContinueLearningSection()),
                const Gap(16),
                Text(
                  LocaleKeys.in_progress.tr(),
                  style: context.appTheme.bold20,
                ).withHorizontalPadding(Constants.hp16),
                const Gap(16),
              ],
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: Constants.hp16),
            sliver: SliverList.separated(
              itemBuilder: (_, _) => const InProgreeCardItem(),
              separatorBuilder: (_, _) => const Gap(16),
              itemCount: 5,
            ),
          ),
          const SliverGap(30),
        ],
      ),
    );
  }
}
