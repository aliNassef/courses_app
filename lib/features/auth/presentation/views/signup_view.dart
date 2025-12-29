import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';

import '../widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static String routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return const AdaptiveScaffold(
      body: SafeArea(
        child: SignupViewBody(),
      ),
    );
  }
}
