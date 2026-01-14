import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import '../widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const routeName = 'splash_view';

  @override
  Widget build(BuildContext context) {
    return const AdaptiveScaffold(
      body: SplashViewBody(),
    );
  }
}
