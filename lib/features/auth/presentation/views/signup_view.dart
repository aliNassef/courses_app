import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:courses_app/core/constants/constants.dart';
import 'package:courses_app/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/utils/utils.dart';
import '../widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const String routeName = 'signup_view';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: AdaptiveScaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: context.height,
              width: context.width,
              color: AppColors.white,
              child: const SignupViewBody().withHorizontalPadding(
                Constants.hp16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
