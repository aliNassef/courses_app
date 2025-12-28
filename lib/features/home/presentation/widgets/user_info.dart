import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:courses_app/features/cart/presentation/view/cart_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/navigation/navigation.dart';
import '../../../../core/translations/locale_keys.g.dart';
import '../../../../core/utils/utils.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AdaptiveListTile(
      padding: EdgeInsets.zero,
      title: Text(
        LocaleKeys.welcome_back.tr(),
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
        child: CircleAvatar(
          backgroundColor: AppColors.white,
          radius: 21,
          child: GestureDetector(
            onTap: () {
              context.pushNamed(
                CartView.routeName,
                arguments: const NavArgs(
                  animation: NavAnimation.fade,
                ),
              );
            },
            child: const Icon(
              CupertinoIcons.cart_fill,
              color: AppColors.black,
              size: 24,
            ),
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
