import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/navigation/navigation.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../courses/data/models/course_model.dart';
import '../../../courses/presentation/view/course_details_view.dart';
import '../../../courses/presentation/view_model/courses_cubit/courses_cubit.dart';
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
        child: BlocBuilder<CoursesCubit, CoursesState>(
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
                  itemCount: CourseModel.dummyData.length,
                  itemBuilder: (_, index) {
                    return SizedBox(
                      width: context.width * 0.8,
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
