import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:courses_app/core/di/di.dart';
import 'package:courses_app/features/home/presentation/widgets/cart_animation_scope.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/service_locator.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  Function(GlobalKey)? runAddToCartAnimation;

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => injector<CoursesCubit>()..getAllCourses(),
            ),
            BlocProvider(
              create: (context) => injector<CartCubit>()
                ..getCartItemsCount(
                  context.read<AuthCubit>().userId,
                ),
            ),
            BlocProvider(
              create: (context) => injector<CategoryCubit>()..getCategories(),
            ),
            BlocProvider(
              create: (context) => injector<WishlistCubit>(),
            ),
          ],
          child: Builder(
            builder: (context) {
              return AddToCartAnimation(
                cartKey: cartKey,
                createAddToCartAnimation: (runAnimation) {
                  runAddToCartAnimation = runAnimation;
                },
                child: CartAnimationScope(
                  cartKey: cartKey,
                  runAddToCartAnimation: (key) {
                    if (runAddToCartAnimation != null) {
                      runAddToCartAnimation!(key);
                    }
                  },
                  child: const HomeViewBody(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
