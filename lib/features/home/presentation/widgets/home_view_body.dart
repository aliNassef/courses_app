import 'package:courses_app/core/constants.dart';
import 'package:courses_app/core/extensions/mediaquery_size.dart';
import 'package:courses_app/core/extensions/padding_extension.dart';
import 'package:courses_app/core/navigation/navigation.dart';
import 'package:courses_app/core/widgets/custom_search_bar.dart';
import 'package:courses_app/core/widgets/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../core/translations/locale_keys.g.dart';
import '../../../../core/utils/utils.dart';
import '../../../courses/presentation/view/course_details_view.dart';
import 'continued_learning_card_item.dart';
import '../widgets/explore_course_card_item.dart';
import '../widgets/user_info.dart';
import 'category_card_item.dart';
import '../../../../core/widgets/title_with_see_all.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              const UserInfo(),
              const Gap(16),
              const CustomSearchBar(),
              const Gap(30),
              Text(
                LocaleKeys.continue_learning.tr(),
                style: context.appTheme.bold20,
              ),
              const Gap(16),
              const ContinuedLearningCardItem(),
              const Gap(30),
              TitleWithSeeAll(
                title: LocaleKeys.popular_courses.tr(),
              ),
              const Gap(16),
            ],
          ).withHorizontalPadding(Constants.hp16),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 280.h,
            width: context.width,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: Constants.hp16),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (_, _) => const Gap(16),
              itemCount: 6,
              itemBuilder: (_, index) {
                return SizedBox(
                  width: context.width * 0.8,
                  child: GestureDetector(
                    onTap: () => context.pushNamed(
                      CourseDetailsView.routeName,
                      arguments: const NavArgs(
                        animation: NavAnimation.fade,
                      ),
                    ),
                    child: const ExploreCourseCardItem(),
                  ),
                );
              },
            ),
          ),
        ),
        const SliverGap(16),
        SliverToBoxAdapter(
          child: Text(
            LocaleKeys.browse_categories.tr(),
            style: context.appTheme.bold20,
          ).withHorizontalPadding(Constants.hp16),
        ),
        const SliverGap(16),
        SliverPadding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: Constants.hp16,
          ),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 2.2,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const CategoryCardItem();
              },
              childCount: 6,
            ),
          ),
        ),
        const SliverGap(16),
      ],
    );
  }
}
