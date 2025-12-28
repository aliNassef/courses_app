import 'dart:io';
import 'package:courses_app/core/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/logging/app_logger.dart';
import '../../../../core/navigation/navigation.dart';
import '../widgets/cart_view_body.dart';
import '../widgets/total_price_and_checkout_button.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const String routeName = 'cart_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: _buildCartAppBar(context),
      ),
      body: const SafeArea(
        child: CartViewBody(),
      ),

      bottomNavigationBar: const TotalPriceAndCheckoutButton(),
    );
  }

  Widget _buildCartAppBar(BuildContext context) {
    return Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(
              'My Cart (3 Items)',
              style: context.appTheme.bold16,
            ),
            leading: IconButton(
              icon: const Icon(CupertinoIcons.back),
              onPressed: () {
                AppLogger.info('back button pressed');
                context.pop();
              },
            ),
          )
        : AppBar(
            backgroundColor: const Color(0xfff6f7f8),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                AppLogger.info('back button pressed');
                context.pop();
              },
            ),
            centerTitle: true,
            title: Text(
              'My Cart (3 Items)',
              style: context.appTheme.bold16,
            ),
          );
  }
}
