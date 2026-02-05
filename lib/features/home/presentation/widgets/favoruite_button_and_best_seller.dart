import '../../../../core/di/di.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/translations/locale_keys.g.dart';
import '../../../../core/utils/utils.dart';
import '../../../wishlist/data/models/wishlist_model.dart';
import 'explore_course_card_item.dart';

class FavoruiteButtonAndBestSeller extends StatelessWidget {
  const FavoruiteButtonAndBestSeller({
    super.key,
    required this.widget,
  });

  final ExploreCourseCardItem widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Visibility(
          visible: widget.course.bestSeller,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.85),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Text(
              LocaleKeys.best_sellers.tr(),
              style: context.appTheme.medium14.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            _addOrRemoveFromWishlist(context);
          },
          child: BlocBuilder<WishlistCubit, WishlistState>(
            buildWhen: (previous, current) {
              return current is AddOrRemoveCourseFromWishlistSuccess ||
                  current is AddCourseToWishlistError;
            },
            builder: (context, state) {
              if (state is AddOrRemoveCourseFromWishlistSuccess) {
                if (state.ids.contains(widget.course.id)) {
                  return const CircleAvatar(
                    backgroundColor: AppColors.backgroundColor,
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.primary,
                    ),
                  );
                } else {
                  return const CircleAvatar(
                    backgroundColor: AppColors.primary,
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.white,
                    ),
                  );
                }
              } else {
                return const CircleAvatar(
                  backgroundColor: AppColors.primary,
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.white,
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }

  void _addOrRemoveFromWishlist(BuildContext context) {
    var userId = context.read<AuthCubit>().userId;
    var wishmodel = WishlistModel(
      courseId: widget.course.id,
      createdAt: DateTime.now(),
    );
    var state = context.read<WishlistCubit>().state;
    if (state is AddOrRemoveCourseFromWishlistSuccess &&
        state.ids.contains(widget.course.id)) {
      context.read<WishlistCubit>().removeFromWishlist(
        userId,
        widget.course.id,
      );
    } else {
      context.read<WishlistCubit>().addToWishlist(userId, wishmodel);
    }
  }
}
