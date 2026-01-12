import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/utils/utils.dart';
import '../../../cart/data/models/cart_model.dart';
import '../../../courses/data/models/course_model.dart';
import 'cart_animation_scope.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.cartAnimationScope,
    required this.imageKey,
    required this.course,
  });
  final CartAnimationScope cartAnimationScope;
  final GlobalKey imageKey;
  final CourseModel course;
  @override
  Widget build(BuildContext context) {
    var count = 0;
    return BlocSelector<CartCubit, CartState, GetCartItemsCountSuccess>(
      selector: (state) {
        if (state is GetCartItemsCountSuccess) {
          cartAnimationScope.cartKey.currentState?.runCartAnimation(
            (state.count).toString(),
          );
          count = state.count;
        }
        return GetCartItemsCountSuccess(count);
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            await cartAnimationScope.runAddToCartAnimation(
              imageKey,
            );

            if (context.mounted) {
              context.read<CartCubit>().updateCartItemsCount(
                state.count + 1,
              );
              _addToCart(context);
            }
            cartAnimationScope.cartKey.currentState?.runCartAnimation(
              (state.count + 1).toString(),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xffe7f2fd),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.add,
              color: AppColors.primary,
              size: 24,
            ),
          ),
        );
      },
    );
  }

  void _addToCart(BuildContext context) {
    var cart = CartModel(
      courseId: course.id,
      instructorId: course.instructorId,
      rating: course.rating,
      addedAt: DateTime.now(),
      image: course.imageUrl,
      price: course.price.toDouble(),
      title: course.title,
    );
    final userId = context.read<AuthCubit>().userId;
    context.read<CartCubit>().addToCart(
      userId: userId,
      cart: cart,
    );
  }
}
