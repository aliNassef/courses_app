import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/widgets.dart';
import '../../data/models/category_model.dart';

class CategoryCardItem extends StatelessWidget {
  const CategoryCardItem({super.key, required this.category});
  final CategoryModel category;
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
              category.name,
              style: context.appTheme.bold16,
            ),
          ),
        ],
      ).withAllPadding(10),
    );
  }
}
