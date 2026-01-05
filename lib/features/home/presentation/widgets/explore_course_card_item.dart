import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:courses_app/core/widgets/custom_network_image.dart';
import 'package:gap/gap.dart';
import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/utils/utils.dart';
import '../../../courses/data/models/course_model.dart';
import 'add_to_cart_button.dart';
import 'cart_animation_scope.dart';
import 'favoruite_button_and_best_seller.dart';
import 'instructor_name.dart';

class ExploreCourseCardItem extends StatefulWidget {
  const ExploreCourseCardItem({
    super.key,
    required this.course,
  });
  final CourseModel course;

  @override
  State<ExploreCourseCardItem> createState() => _ExploreCourseCardItemState();
}

class _ExploreCourseCardItemState extends State<ExploreCourseCardItem> {
  final GlobalKey imageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final cartAnimationScope = CartAnimationScope.of(
      context,
    );
    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: .start,
            children: [
              Container(
                key: imageKey,
                child: CustomNetworkImage(
                  img: widget.course.imageUrl,
                  height: 140.h,
                  width: context.width,
                  topStartRadius: 12.r,
                  topEndRadius: 12.r,
                ),
              ),
              const Gap(16),
              Row(
                spacing: 4.w,
                children: [
                  const Icon(
                    Icons.star,
                    color: Color(0xffeab308),
                    size: 16,
                  ),
                  Text(
                    '${widget.course.rating}',
                    style: context.appTheme.bold10,
                  ),
                  Text(
                    '(${widget.course.numOfRating})',
                    style: context.appTheme.bold10.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ).withHorizontalPadding(10),
              const Gap(8),
              Text(
                widget.course.title,
                style: context.appTheme.bold16,
              ).withHorizontalPadding(10),
              const Gap(8),
              widget.course.instructorId.isNotEmpty
                  ? InstructorName(
                      instructorId: widget.course.instructorId,
                    ).withHorizontalPadding(10)
                  : const SizedBox.shrink(),
              const Gap(16),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    '${widget.course.price} EGP',
                    style: context.appTheme.bold16.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  AddToCartButton(
                    cartAnimationScope: cartAnimationScope,
                    imageKey: imageKey,
                    course: widget.course,
                  ),
                ],
              ).withHorizontalPadding(10),
              const Gap(8),
            ],
          ),
          FavoruiteButtonAndBestSeller(widget: widget).withAllPadding(10.r),
        ],
      ),
    );
  }
}
