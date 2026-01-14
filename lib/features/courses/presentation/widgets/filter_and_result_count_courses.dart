import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:courses_app/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/padding_extension.dart';

import '../../../../core/utils/utils.dart';
import '../filter_enum.dart';
import '../view_model/courses_category_cubit/courses_category_cubit.dart';

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
              AdaptivePopupMenuButton.icon<Filter>(
                icon: Icons.filter_list_sharp,
                tint: AppColors.primary,
                buttonStyle: PopupButtonStyle.filled,
                items: [
                  const AdaptivePopupMenuItem(
                    label: 'Name',
                    value: Filter.name,
                  ),
                  const AdaptivePopupMenuDivider(),
                  const AdaptivePopupMenuItem(
                    label: 'Price',
                    value: Filter.price,
                  ),
                  const AdaptivePopupMenuDivider(),
                  const AdaptivePopupMenuItem(
                    label: 'Rating',
                    value: Filter.rating,
                  ),
                ],
                onSelected: (index, item) {
                  context.read<CoursesCategoryCubit>().onFilterChange(
                    item.value ?? Filter.name,
                  );
                },
              ).backInLeft(),
            ],
          ).withHorizontalPadding(Constants.hp16);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
