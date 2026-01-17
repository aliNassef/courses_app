import 'package:flutter/material.dart';
import 'navigation.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    final navArgs = args is NavArgs ? args : const NavArgs(data: null);

    late final Widget page;
    switch (settings.name) {
      case SplashView.routeName:
        page = const SplashView();
        break;
      case SignupView.routeName:
        page = const SignupView();
        break;
      case AllCoursesView.routeName:
        final CourseDiscoveryCubit discoveryCubit =
            navArgs.data as CourseDiscoveryCubit;
        page = AllCoursesView(courseDiscoveryCubit: discoveryCubit);
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
        final course = navArgs.data as CourseModel;
        page = CourseDetailsView(course: course);
        break;
      case CourseWatchView.routeName:
        final courseArgs = navArgs.data as CourseArgs;
        page = CourseWatchView(courseArgs: courseArgs);
        break;
      case ForgetPasswordView.routeName:
        page = const ForgetPasswordView();
        break;
      case CoursesByCategoryView.routeName:
        final categoryNavArgs = navArgs.data as CategoryNavArgs;
        page = CoursesByCategoryView(categoryNavArgs: categoryNavArgs);
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
