import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:courses_app/core/constants.dart';
import 'package:courses_app/core/extensions/mediaquery_size.dart';
import 'package:courses_app/core/widgets/custom_network_image.dart';
import 'package:courses_app/core/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/utils.dart';
import 'wish_list_card_item.dart';

class WishListViewBody extends StatelessWidget {
  const WishListViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      width: context.width,
      color: AppColors.backgroundColor,
      child: ListView.separated(
        padding: EdgeInsets.all(Constants.hp16),
        itemBuilder: (_, _) => const WishListCardItem(),
        separatorBuilder: (_, _) => const Gap(16),
        itemCount: 10,
      ),
    );
  }
}
