import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/widgets.dart';

class AccountTile extends StatelessWidget {
  const AccountTile({
    super.key,
    required this.text,
    this.type,
    required this.icon,
  });
  final String text;
  final IconData icon;
  final String? type;
  @override
  Widget build(BuildContext context) {
    return AdaptiveListTile(
      leading: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: AppColors.lightGrey.withValues(alpha: 0.3),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: AppColors.grey,
        ),
      ),
      title: Text(
        text,
        style: context.appTheme.bold14.copyWith(
          color: AppColors.grey,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ?type != null
              ? Text(
                  type!,
                  style: context.appTheme.medium12.copyWith(
                    color: AppColors.grey,
                  ),
                )
              : null,
          const Gap(10),
          Icon(
            Icons.arrow_forward_ios,
            color: AppColors.grey,
            size: 18.sp,
          ),
        ],
      ),
    );
  }
}
