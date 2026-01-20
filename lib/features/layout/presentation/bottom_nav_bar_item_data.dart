import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/translations/locale_keys.g.dart';

class BottomNavBarItemData {
  final String title;
  final IconData icon;

  const BottomNavBarItemData({
    required this.title,
    required this.icon,
  });
}

final bottomNavBarItemsData = [
  BottomNavBarItemData(
    title: LocaleKeys.home.tr(),
    icon: CupertinoIcons.home,
  ),
  BottomNavBarItemData(
    title: LocaleKeys.my_learning.tr(),
    icon: CupertinoIcons.bookmark,
  ),
  BottomNavBarItemData(
    title: LocaleKeys.wishlist.tr(),
    icon: CupertinoIcons.heart,
  ),
  BottomNavBarItemData(
    title: LocaleKeys.profile.tr(),
    icon: CupertinoIcons.person,
  ),
];
