import 'package:courses_app/core/constants.dart';
import 'package:courses_app/core/extensions/mediaquery_size.dart';
import 'package:courses_app/core/extensions/padding_extension.dart';
import 'package:courses_app/core/utils/utils.dart';
import 'package:courses_app/features/cart/presentation/widgets/cart_item.dart';
import 'package:courses_app/features/cart/presentation/widgets/coupon_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

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
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemBuilder: (context, index) => const CartItem(),
                separatorBuilder: (context, index) => const Gap(16),
                itemCount: 6,
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
