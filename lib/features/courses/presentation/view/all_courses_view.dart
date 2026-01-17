import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import '../../../../core/di/service_locator.dart';
import '../widgets/list/all_courses_view_body.dart';
import '../../../home/presentation/widgets/cart_animation_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';

class AllCoursesView extends StatefulWidget {
  const AllCoursesView({super.key, required this.courseDiscoveryCubit});
  final CourseDiscoveryCubit courseDiscoveryCubit;
  static const String routeName = 'all-courses';

  @override
  State<AllCoursesView> createState() => _AllCoursesViewState();
}

class _AllCoursesViewState extends State<AllCoursesView> {
  final GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  Function(GlobalKey)? runAddToCartAnimation;

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: widget.courseDiscoveryCubit,
            ),
            BlocProvider(
              create: (context) => injector<CartCubit>(),
            ),
            BlocProvider(
              create: (context) => injector<WishlistCubit>(),
            ),
          ],
          child: AddToCartAnimation(
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
              child: const AllCoursesViewBody(),
            ),
          ),
        ),
      ),
    );
  }
}
