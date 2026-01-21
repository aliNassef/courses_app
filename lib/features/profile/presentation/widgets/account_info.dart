import '../../../../core/constants/constants.dart';
import '../../../../core/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/navigation/navigation.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/widgets.dart';
import 'account_tile.dart';

class AccountsInfo extends StatelessWidget {
  const AccountsInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          AccountTile(
            text: LocaleKeys.personal_information.tr(),
            icon: Icons.person,
          ),
          const Divider(),
          AccountTile(
            text: LocaleKeys.my_cart.tr(),
            icon: Icons.card_travel_sharp,
            onTap: () {
              _goToCart(context);
            },
          ),
          const Divider(),
          AccountTile(
            text: LocaleKeys.subscriptions.tr(),
            icon: Icons.subscriptions,
            type: 'Basic',
          ),
          const Divider(),
          AccountTile(
            text: LocaleKeys.settings.tr(),
            icon: Icons.settings,
            onTap: () {
              _buildApppLanguageBottomSheet(context);
            },
          ),
        ],
      ),
    );
  }

  Future<dynamic> _buildApppLanguageBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 200.h,
          color: AppColors.white,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(
                  Icons.language,
                  color: AppColors.primary,
                ),
                title: const Text('Language'),
                titleTextStyle: context.appTheme.bold14.copyWith(
                  color: AppColors.primary,
                ),
                onTap: () {
                  context.pop();
                },
              ),
              const Divider(),
              ListTile(
                leading: CircleAvatar(
                  radius: 14,
                  child: Text(
                    'AR',
                    style: context.appTheme.regular12,
                  ),
                ),
                title: const Text('العربيه'),
                onTap: () {
                  context.setLocale(Constants.arLocale);
                  context.pop();
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 14,
                  child: Text(
                    'EN',
                    style: context.appTheme.regular12,
                  ),
                ),
                title: const Text('English'),
                onTap: () {
                  context.setLocale(Constants.enLocale);
                  context.pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _goToCart(BuildContext context) {
    context.pushNamed(
      CartView.routeName,
      arguments: const NavArgs(
        animation: NavAnimation.fade,
      ),
    );
  }
}
