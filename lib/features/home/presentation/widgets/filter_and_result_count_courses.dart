import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/custom_failure_widget.dart';
import '../../../courses/presentation/view_model/courses_category_cubit/courses_category_cubit.dart';

class FilterAndResultCountCourses extends StatelessWidget {
  const FilterAndResultCountCourses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursesCategoryCubit, CoursesCategoryState>(
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'data',
                  style: context.appTheme.medium14.copyWith(
                    color: AppColors.grey,
                  ),
                ),
                const Icon(
                  Icons.filter_list_sharp,
                  color: AppColors.primary,
                ),
              ],
            ).withHorizontalPadding(Constants.hp16),
          );
        }
        if (state is CoursesCategorySuccess) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "showing ${state.courses.length} courses",
                style: context.appTheme.medium14.copyWith(
                  color: AppColors.grey,
                ),
              ),
              const Icon(
                Icons.filter_list_sharp,
                color: AppColors.primary,
              ),
            ],
          ).withHorizontalPadding(Constants.hp16);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
