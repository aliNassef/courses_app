import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:courses_app/core/di/service_locator.dart';
import 'package:courses_app/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:courses_app/features/courses/presentation/widgets/all_courses_view_body.dart';
import 'package:courses_app/features/home/presentation/widgets/cart_animation_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/courses_cubit/courses_cubit.dart';

class AllCoursesView extends StatefulWidget {
  const AllCoursesView({super.key, required this.coursesCubit});
  final CoursesCubit coursesCubit;
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
              value: widget.coursesCubit,
            ),
            BlocProvider(
              create: (context) => injector<CartCubit>(),
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
