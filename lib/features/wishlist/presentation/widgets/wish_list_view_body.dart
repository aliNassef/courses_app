import 'package:courses_app/core/constants/constants.dart';
import 'package:courses_app/core/extensions/mediaquery_size.dart';
import 'package:courses_app/core/widgets/custom_failure_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/di/di.dart';
import '../../../../core/utils/utils.dart';
import '../../../courses/data/models/course_model.dart';
import 'wish_list_card_item.dart';

class WishListViewBody extends StatelessWidget {
  const WishListViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      width: context.width,
      color: AppColors.backgroundColor,
      child: BlocBuilder<WishlistCubit, WishlistState>(
        buildWhen: (previous, current) =>
            current is WishlistLoaded ||
            current is WishlistError ||
            current is WishlistLoading,
        builder: (context, state) {
          if (state is WishlistLoading) {
            return Skeletonizer(
              enabled: true,
              child: ListView.separated(
                padding: EdgeInsets.all(Constants.hp16),
                itemBuilder: (_, _) => WishListCardItem(
                  course: CourseModel.dummyData[0],
                ),
                separatorBuilder: (_, _) => const Gap(16),
                itemCount: 10,
              ),
            );
          }
          if (state is WishlistError) {
            return CustomFailureWidget(meesage: state.failure.errMessage);
          }

          if (state is WishlistLoaded) {
            return RefreshIndicator.adaptive(
              color: AppColors.primary,
              onRefresh: () async {
                final userId = context.read<AuthCubit>().userId;
                context.read<WishlistCubit>().getWishlistCourses(userId);
              },
              child: ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.all(Constants.hp16),
                itemBuilder: (_, index) => WishListCardItem(
                  course: state.courses[index],
                ),
                separatorBuilder: (_, _) => const Gap(16),
                itemCount: state.courses.length,
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
