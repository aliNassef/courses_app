import 'package:flutter/cupertino.dart';

class BottomNavBarItemData {
  final String title;
  final IconData icon;

  const BottomNavBarItemData({
    required this.title,
    required this.icon,
  });
}

const bottomNavBarItemsData = [
  BottomNavBarItemData(title: 'Home', icon: CupertinoIcons.home),
  BottomNavBarItemData(title: 'My Learning', icon: CupertinoIcons.bookmark),
  BottomNavBarItemData(title: 'Wishlist', icon: CupertinoIcons.heart),
  BottomNavBarItemData(title: 'Profile', icon: CupertinoIcons.person),
];
