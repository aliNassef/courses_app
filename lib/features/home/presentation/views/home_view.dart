import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:courses_app/core/utils/app_assets.dart';
import 'package:courses_app/core/utils/app_color.dart';
import 'package:courses_app/core/utils/theme/app_theme_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdaptiveScaffold(
      body: Column(
        children: [
          UserInfo(),
          Gap(24),
          
        ],
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AdaptiveListTile(
      title: Text(
        'Welcome back',
        style: context.appTheme.regular12.copyWith(
          color: AppColors.grey,
        ),
      ),
      subtitle: Text(
        'ALi Nassef',
        style: context.appTheme.bold16.copyWith(
          color: AppColors.black,
        ),
      ),
      trailing: Material(
        elevation: 2,
        shadowColor: AppColors.grey.withValues(alpha: 0.4),
        shape: const CircleBorder(),
        child: const CircleAvatar(
          backgroundColor: AppColors.white,
          radius: 21,
          child: Icon(
            CupertinoIcons.cart_fill,
            color: AppColors.black,
            size: 24,
          ),
        ),
      ),
      leading: const CircleAvatar(
        radius: 22,
        backgroundImage: AssetImage(AppAssets.profile),
      ),
    );
  }
}
