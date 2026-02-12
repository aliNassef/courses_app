import 'package:courses_app/core/utils/validators.dart';
import 'package:courses_app/core/widgets/default_app_button.dart';
import 'package:courses_app/features/courses/presentation/view_model/review_cubit/review_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';

import '../../../../../core/navigation/app_navigation.dart';
import '../../../../../core/translations/locale_keys.g.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../data/models/review_model.dart';

void showReviewDialog(
  BuildContext context,
  String courseId,
  String userId,
  ReviewCubit reviewCubit,
) {
  double rating = 0;
  final controller = TextEditingController();

  showDialog(
    context: context,
    builder: (_) => BlocProvider.value(
      value: reviewCubit,
      child: Builder(
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.white,
            title: Text(
              "${LocaleKeys.rate_this_course.tr()} ⭐",
              style: context.appTheme.medium16,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                StatefulBuilder(
                  builder: (context, setState) => RatingBar.builder(
                    initialRating: rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    unratedColor: AppColors.grey.withValues(alpha: 0.3),
                    onRatingUpdate: (val) {
                      setState(() {
                        rating = val;
                      });
                    },
                  ),
                ),
                const Gap(16),
                CustomTextFormField(
                  controller: controller,
                  hintText: LocaleKeys.write_your_review.tr(),
                  validator: Validators.fieldIsRequired,
                ),
              ],
            ),
            actions: [
              BlocConsumer<ReviewCubit, ReviewState>(
                listener: (context, state) {
                  if (state is ReviewSubmitted) {
                    controller.clear();
                    context.pop();
                  }
                },
                builder: (context, state) {
                  return DefaultAppButton(
                    onPressed: () {
                      var review = ReviewModel(
                        userId: userId,
                        rating: rating,
                        createdAt: DateTime.now(),
                        userImage: "",
                        userName: "",
                        comment: controller.text,
                      );
                      context.read<ReviewCubit>().submitReview(
                        courseId,
                        review,
                      );
                    },
                    text: state is GetReviewLoading
                        ? "Loading..."
                        : LocaleKeys.submit.tr(),
                  );
                },
              ),
            ],
          );
        },
      ),
    ),
  );
}
