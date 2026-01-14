import 'dart:io';
import '../../../../core/di/di.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/logging/app_logger.dart';
import '../../../../core/navigation/navigation.dart';
import '../widgets/cart_view_body.dart';
import '../widgets/total_price_and_checkout_button.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const String routeName = 'cart_view';
  @override
  Widget build(BuildContext context) {
    final userId = injector<AuthCubit>().userId;
    return BlocProvider(
      create: (context) => injector<CartCubit>()..getCart(userId),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: _buildCartAppBar(context),
        ),
        body: const SafeArea(
          child: CartViewBody(),
        ),

        bottomNavigationBar: const TotalPriceAndCheckoutButton(),
      ),
    );
  }

  Widget _buildCartAppBar(BuildContext context) {
    return Platform.isIOS
        ? BlocSelector<CartCubit, CartState, GetCartLoaded?>(
            selector: (state) {
              if (state is GetCartLoaded) {
                return state;
              }
              return null;
            },
            builder: (context, state) {
              if (state == null) {
                return Skeletonizer(
                  enabled: true,
                  child: CupertinoNavigationBar(
                    middle: Text(
                      'My Cart (0 Items)',
                      style: context.appTheme.bold16,
                    ),
                    leading: IconButton(
                      icon: const Icon(CupertinoIcons.back),
                      onPressed: () {
                        AppLogger.info('back button pressed');
                        context.pop();
                      },
                    ),
                  ),
                );
              }

              return CupertinoNavigationBar(
                middle: Text(
                  'My Cart (${state.cart.length} Items)',
                  style: context.appTheme.bold16,
                ),
                leading: IconButton(
                  icon: const Icon(CupertinoIcons.back),
                  onPressed: () {
                    AppLogger.info('back button pressed');
                    context.pop();
                  },
                ),
              );
            },
          )
        : BlocSelector<CartCubit, CartState, GetCartLoaded?>(
            selector: (state) {
              if (state is GetCartLoaded) {
                return state;
              }
              return null;
            },
            builder: (context, state) {
              if (state == null) {
                return Skeletonizer(
                  enabled: true,
                  child: AppBar(
                    backgroundColor: const Color(0xfff6f7f8),
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        AppLogger.info('back button pressed');
                        context.pop();
                      },
                    ),
                  ),
                );
              }

              return AppBar(
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
                  'My Cart (${state.cart.length} Items)',
                  style: context.appTheme.bold16,
                ),
              );
            },
          );
  }
}
