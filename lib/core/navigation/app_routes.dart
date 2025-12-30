import '../../features/auth/presentation/views/forget_password_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/cart/presentation/view/cart_view.dart';
import '../../features/courses/presentation/view/course_details_view.dart';
import '../../features/courses/presentation/view/course_view.dart';
import '../../features/layout/presentation/view/layout_view.dart';
import 'navigation.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    final navArgs = args is NavArgs ? args : const NavArgs(data: null);

    late final Widget page;
    switch (settings.name) {
      case SignupView.routeName:
        page = const SignupView();
        break;
      case LoginView.routeName:
        page = const LoginView();
        break;
      case LayoutView.routeName:
        page = const LayoutView();
        break;
      case CartView.routeName:
        page = const CartView();
        break;
      case CourseDetailsView.routeName:
        page = const CourseDetailsView();
        break;
      case CourseView.routeName:
        page = const CourseView();
        break;
      case ForgetPasswordView.routeName:
        page = const ForgetPasswordView();
        break;
      default:
        page = const Scaffold(body: Center(child: Text('Page not found')));
    }

    return PageRouteBuilder(
      settings: settings,
      transitionDuration: navArgs.animation == NavAnimation.none
          ? Duration.zero
          : navArgs.duration,
      reverseTransitionDuration: navArgs.animation == NavAnimation.none
          ? Duration.zero
          : navArgs.duration,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        switch (navArgs.animation) {
          case NavAnimation.fade:
            return FadeTransition(opacity: animation, child: child);
          case NavAnimation.translate:
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          case NavAnimation.none:
            return child;
        }
      },
    );
  }
}
