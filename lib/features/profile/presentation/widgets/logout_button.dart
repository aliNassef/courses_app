import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/widgets.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AdaptiveButton.child(
      style: AdaptiveButtonStyle.filled,
      size: AdaptiveButtonSize.large,
      minSize: Size(context.width, kToolbarHeight),
      borderRadius: BorderRadius.circular(12.r),
      color: const Color(0xfffef2f2),
      child: Text(
        'Log Out',
        style: context.appTheme.bold16.copyWith(color: AppColors.red),
      ),
      onPressed: () {},
    );
  }
}
