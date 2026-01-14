import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import '../../../../core/utils/app_color.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/widgets/widgets.dart';
import '../widgets/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  static const String routeName = 'forget-password';

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          height: context.height,
          width: context.width,
          color: AppColors.white,
          child: const ForgetPasswordViewBody(),
        ),
      ),
    );
  }
}
