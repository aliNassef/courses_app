import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/navigation/navigation.dart';
import '../../../../core/widgets/custom_failure_widget.dart';
import '../../../../core/widgets/custom_search_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/translations/locale_keys.g.dart';
import '../../../../core/utils/utils.dart';
import '../../../my_learning/data/model/my_learning_model.dart';
import '../../../my_learning/presentation/view_model/mylearning_cubit/my_leaning_cubit.dart';
import 'category_grid_bloc_builder.dart';
import 'continued_learning_card_item.dart';
import '../widgets/user_info.dart';
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
              BlocBuilder<MyLearningCubit, MyLearningState>(
                buildWhen: (previous, current) =>
                    current is GetLastLearningCourseSuccess ||
                    current is GetLastLearningCourseFailure ||
                    current is GetLastLearningCourseLoading,
                builder: (context, state) {
                  if (state is GetLastLearningCourseFailure) {
                    return CustomFailureWidget(
                      meesage: state.failure.errMessage,
                    );
                  }
                  if (state is GetLastLearningCourseLoading) {
                    return Skeletonizer(
                      enabled: true,
                      child: ContinuedLearningCardItem(
                        course: MyLearningModel(
                          courseId: 'course_001',
                          instructorId: "",
                          courseTitle: 'Flutter From Zero to Hero',
                          description:
                              'A comprehensive course to master Flutter development',
                          courseImage:
                              'https://dummyimage.com/600x400/000/fff&text=Flutter+Course',
                          progress: .5,
                          completedLessons: 7,
                          totalLessons: 20,
                          lastLessonId: 'lesson_07',
                          status: 'ongoing',
                          enrolledAt: DateTime.now().subtract(
                            const Duration(days: 10),
                          ),
                          updatedAt: DateTime.now(),
                        ),
                      ),
                    );
                  }

                  if (state is GetLastLearningCourseSuccess) {
                    return ContinuedLearningCardItem(
                      course: state.learning,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
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
          sliver: const CategoryGridBlocBuilder(),
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
