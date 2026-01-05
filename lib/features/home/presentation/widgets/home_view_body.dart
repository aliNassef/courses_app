import 'package:courses_app/core/constants/constants.dart';
import 'package:courses_app/core/extensions/padding_extension.dart';
import 'package:courses_app/core/navigation/navigation.dart';
import 'package:courses_app/core/widgets/custom_search_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../core/translations/locale_keys.g.dart';
import '../../../../core/utils/utils.dart';
import '../../../courses/presentation/view/all_courses_view.dart';
import '../../../courses/presentation/view_model/courses_cubit/courses_cubit.dart';
import 'continued_learning_card_item.dart';
import '../widgets/user_info.dart';
import 'category_card_item.dart';
import '../../../../core/widgets/title_with_see_all.dart';
import 'explore_more_courses.dart';

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
                onTap: () {
                  _goToAllCourses(context);
                },
              ),
              const Gap(16),
            ],
          ).withHorizontalPadding(Constants.hp16),
        ),
        const ExploreMoreCourses(),
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

  void _goToAllCourses(BuildContext context) {
    context.pushNamed(
      AllCoursesView.routeName,
      arguments: NavArgs(
        animation: NavAnimation.fade,
        data: context.read<CoursesCubit>(),
      ),
    );
  }
}
