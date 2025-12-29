import 'package:flutter/material.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/widgets.dart';

class AchivementUserInfo extends StatelessWidget {
  const AchivementUserInfo({
    super.key,
    required this.number,
    required this.text,
  });
  final String number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.white,
      ),
      child: Column(
        children: [
          Text(
            number,
            style: context.appTheme.bold20.copyWith(
              color: AppColors.primary,
            ),
          ),
          Text(
            text,
            style: context.appTheme.medium14.copyWith(
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
