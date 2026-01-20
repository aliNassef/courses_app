import 'dart:io';

import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/translations/locale_keys.g.dart';
import '../../../wishlist/presentation/view/wish_list_view.dart';
import '../../../my_learning/presentation/views/my_learning_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lazy_indexed_stack/flutter_lazy_indexed_stack.dart';

import '../../../../core/di/di.dart';
import '../../../../core/navigation/navigation.dart';
import '../../../../core/utils/utils.dart';
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

    context.read<AuthCubit>().getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        if (_currentIndex != 0) {
          setState(() {
            _currentIndex = 0;
          });
          return;
        }
        final bool? shouldPop = await showAdaptiveDialog<bool>(
          context: context,
          builder: (context) => AlertDialog.adaptive(
            title: Text(
              LocaleKeys.exit_app.tr(),
              style: context.appTheme.bold16.copyWith(color: AppColors.red),
            ),
            content: Text(
              LocaleKeys.are_you_sure_you_want_to_exit.tr(),
              style: context.appTheme.bold12.copyWith(color: AppColors.primary),
            ),
            actions: [
              TextButton(
                onPressed: () => context.pop(result: false),
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.primary,
                ),
                child: Text(
                  LocaleKeys.cancel.tr(),
                  style: context.appTheme.bold12,
                ),
              ),
              TextButton(
                onPressed: () => context.pop(result: true),
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.red,
                ),
                child: Text(
                  LocaleKeys.exit.tr(),
                  style: context.appTheme.bold12,
                ),
              ),
            ],
          ),
        );

        if (shouldPop == true) {
          if (Platform.isAndroid) {
            SystemNavigator.pop();
          }
        }
      },
      child: AdaptiveScaffold(
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
      ),
    );
  }
}
