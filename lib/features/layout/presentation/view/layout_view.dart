import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:courses_app/core/utils/app_color.dart';
import 'package:courses_app/features/favorites/presentation/view/wish_list_view.dart';
import 'package:courses_app/features/my_learning/presentation/views/my_learning_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lazy_indexed_stack/flutter_lazy_indexed_stack.dart';

import '../../../home/presentation/views/home_view.dart';
import '../../../profile/presentation/view/profile_view.dart';
import '../bottom_nav_bar_item_data.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});
  static const String routeName = 'layout_view';

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  late final List<Widget> _screens;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _screens = [
      const HomeView(),
      const MyLearningView(),
      const WishListView(),
      const ProfileView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      body: SafeArea(
        child: LazyIndexedStack(
          index: _currentIndex,
          children: _screens,
        ),
      ),

      bottomNavigationBar: AdaptiveBottomNavigationBar(
        selectedItemColor: AppColors.primary,
        useNativeBottomBar: true,
        unselectedItemColor: Colors.grey,
        items: bottomNavBarItemsData
            .map(
              (e) => AdaptiveNavigationDestination(
                icon: e.icon,
                label: e.title,
              ),
            )
            .toList(),
        selectedIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
