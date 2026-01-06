import 'package:courses_app/core/di/di.dart';
import 'package:courses_app/core/extensions/strings_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../home/presentation/widgets/instructor_name.dart';
import '../../data/models/cart_model.dart';
import '../view_model/cart_cubit/cart_cubit.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.cart,
  });
  final CartModel cart;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Row(
        children: [
          CustomNetworkImage(
            img: cart.image,

            height: 85.h,
            width: 100.w,
            radius: 12.r,
          ),
          Gap(Constants.hp16),
          Expanded(
            child: Column(
              mainAxisAlignment: .start,
              crossAxisAlignment: .start,
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        cart.title,
                        style: context.appTheme.bold16,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        _removeCartItem(context);
                      },
                      child: const Icon(
                        CupertinoIcons.delete_solid,
                        color: AppColors.grey,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const Gap(8),
                cart.instructorId.isNullOrEmpty
                    ? const SizedBox.shrink()
                    : InstructorName(
                        instructorId: cart.instructorId,
                      ),
                const Gap(8),
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.star_fill,
                      color: Color(0xffFFC107),
                      size: 16,
                    ),
                    const Gap(8),
                    Text(
                      cart.rating.toString(),
                      style: context.appTheme.regular14.copyWith(
                        color: const Color(0xffFFC107),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '\$${cart.price}',
                      style: context.appTheme.bold16.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ).withHorizontalPadding(12.w).withVerticalPadding(10.h),
    );
  }

  void _removeCartItem(BuildContext context) {
    context.read<CartCubit>().removeCartItem(
      context.read<AuthCubit>().userId,
      cart.courseId,
    );
  }
}
