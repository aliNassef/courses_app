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
          ),
        ],
      ),
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
