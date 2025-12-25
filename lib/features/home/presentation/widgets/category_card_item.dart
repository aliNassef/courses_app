import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/widgets.dart';

class CategoryCardItem extends StatelessWidget {
  const CategoryCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: Colors.red.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.category),
          ),
          const Gap(10),
          Flexible(
            child: Text(
              "Category",
              style: context.appTheme.bold16,
            ),
          ),
        ],
      ).withAllPadding(10),
    );
  }
}
