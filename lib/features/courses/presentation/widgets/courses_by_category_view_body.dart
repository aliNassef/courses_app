import 'package:courses_app/core/constants/constants.dart';
import 'package:courses_app/core/widgets/widgets.dart';
import 'package:courses_app/features/courses/data/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/widgets/custom_failure_widget.dart';
import 'filter_and_result_count_courses.dart';
import '../view_model/courses_category_cubit/courses_category_cubit.dart';
import 'category_course_item.dart';
import 'course_level_chip.dart';

class CoursesByCategoryViewBody extends StatelessWidget {
  const CoursesByCategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(5),
        SizedBox(
          height: 40.h,
          child: const CourseLevelChip(),
        ),
        const Divider(),
        Gap(12.h),
        const FilterAndResultCountCourses(),
        const Gap(16),
        Expanded(
          child: BlocBuilder<CoursesCategoryCubit, CoursesCategoryState>(
            buildWhen: (previous, current) =>
                current is CoursesCategorySuccess ||
                current is CoursesCategoryError ||
                current is CoursesCategoryLoading,
            builder: (context, state) {
              if (state is CoursesCategoryError) {
                return CustomFailureWidget(meesage: state.failure.errMessage);
              }

              if (state is CoursesCategoryLoading) {
                return Skeletonizer(
                  enabled: true,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(
                      horizontal: Constants.hp16,
                      vertical: 10.w,
                    ),
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: CourseModel.dummyData.length,
                    itemBuilder: (context, index) {
                      return CategoryCourseItem(
                        course: CourseModel.dummyData[index],
                      );
                    },
                  ),
                );
              }
              if (state is CoursesCategorySuccess) {
                return ListView.separated(
                  padding: EdgeInsets.symmetric(
                    horizontal: Constants.hp16,
                    vertical: 10.w,
                  ),
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: state.courses.length,
                  itemBuilder: (context, index) {
                    return CategoryCourseItem(course: state.courses[index]);
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
