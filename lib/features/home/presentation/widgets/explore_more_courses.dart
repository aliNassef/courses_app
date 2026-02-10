import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/navigation/navigation.dart';
import '../../../../core/widgets/widgets.dart';
import 'explore_course_card_item.dart';

class ExploreMoreCourses extends StatelessWidget {
  const ExploreMoreCourses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 280.h,
        width: context.width,
        child: BlocBuilder<CourseDiscoveryCubit, CourseDiscoveryState>(
          buildWhen: (_, current) =>
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
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (_, _) => const Gap(16),
                  itemCount: coursesDummyData.length,
                  itemBuilder: (_, index) {
                    return SizedBox(
                      width: context.width * 0.8,
                      child: ExploreCourseCardItem(
                        course: coursesDummyData[index],
                      ),
                    );
                  },
                ),
              );
            }
            if (state is GetAllCoursesSuccess) {
              return ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: Constants.hp16),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, _) => const Gap(16),
                itemCount: state.courses.length,
                itemBuilder: (_, index) {
                  return SizedBox(
                    width: context.width * 0.8,
                    child: GestureDetector(
                      onTap: () => _goToCourseDetails(context, state, index),
                      child: ExploreCourseCardItem(
                        course: state.courses[index],
                      ),
                    ),
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Future<Object?> _goToCourseDetails(
    BuildContext context,
    GetAllCoursesSuccess state,
    int index,
  ) {
    return context.pushNamed(
      CourseDetailsView.routeName,
      arguments: NavArgs(
        animation: NavAnimation.fade,
        data: state.courses[index],
      ),
    );
  }
}
