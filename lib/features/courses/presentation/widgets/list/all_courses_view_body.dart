import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/navigation/navigation.dart';
import '../../../../../core/widgets/custom_failure_widget.dart';
import '../../../../home/presentation/widgets/explore_course_card_item.dart';

class AllCoursesViewBody extends StatelessWidget {
  const AllCoursesViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDiscoveryCubit, CourseDiscoveryState>(
      buildWhen: (previous, current) =>
          current is GetAllCoursesLoading ||
          current is GetAllCoursesError ||
          current is GetAllCoursesSuccess,
      builder: (context, state) {
        if (state is GetAllCoursesError) {
          return CustomFailureWidget(meesage: state.failure.errMessage);
        }
        if (state is GetAllCoursesLoading) {
          return Skeletonizer(
            enabled: true,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: Constants.hp16),
              separatorBuilder: (_, _) => const Gap(16),
              itemCount: CourseModel.dummyData.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () => context.pushNamed(
                    CourseDetailsView.routeName,
                    arguments: const NavArgs(
                      animation: NavAnimation.fade,
                    ),
                  ),
                  child: ExploreCourseCardItem(
                    course: CourseModel.dummyData[index],
                  ),
                );
              },
            ),
          );
        }
        if (state is GetAllCoursesSuccess) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(
              horizontal: Constants.hp16,
              vertical: Constants.hp16,
            ),
            separatorBuilder: (_, _) => const Gap(16),
            itemCount: state.courses.length,
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () => context.pushNamed(
                  CourseDetailsView.routeName,
                  arguments: const NavArgs(
                    animation: NavAnimation.fade,
                  ),
                ),
                child: ExploreCourseCardItem(
                  course: state.courses[index],
                ),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
