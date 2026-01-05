import 'package:courses_app/core/constants/constants.dart';
import 'package:courses_app/core/extensions/mediaquery_size.dart';
import 'package:courses_app/core/extensions/padding_extension.dart';
import 'package:courses_app/core/utils/utils.dart';
import 'package:courses_app/core/widgets/custom_failure_widget.dart';
import 'package:courses_app/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:courses_app/features/cart/presentation/widgets/cart_item.dart';
import 'package:courses_app/features/cart/presentation/widgets/coupon_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../data/models/cart_model.dart';
import 'order_summary_price.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      height: context.height,
      width: context.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(),
            SizedBox(
              height: context.height * 0.55,
              width: context.width,
              child: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (state is GetCartLoading) {
                    return Skeletonizer(
                      enabled: true,
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        itemBuilder: (context, index) => CartItem(
                          cart: CartModel(
                            addedAt: DateTime.now(),
                            instructorId: "AAAAAAAA",
                            rating: 0,
                            courseId: 'aaa',
                            title: 'Ali Nassef',
                            price: 100,
                            image:
                                'https://tse3.mm.bing.net/th/id/OIP.Wwk-gQuVkQHi8a5qiNXY9AHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
                          ),
                        ),
                        separatorBuilder: (context, index) => const Gap(16),
                        itemCount: 6,
                      ),
                    );
                  }

                  if (state is GetCartFailure) {
                    return CustomFailureWidget(
                      meesage: state.failure.errMessage,
                    );
                  }
                  if (state is GetCartLoaded) {
                    return ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      itemBuilder: (context, index) =>
                          CartItem(cart: state.cart[index]),
                      separatorBuilder: (context, index) => const Gap(16),
                      itemCount: state.cart.length,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            Gap(16.h),
            const CouponTextField().withHorizontalPadding(Constants.hp16),
            Gap(16.h),
            const OrderSummaryPrice().withHorizontalPadding(Constants.hp16),
            Gap(16.h),
          ],
        ),
      ),
    );
  }
}
