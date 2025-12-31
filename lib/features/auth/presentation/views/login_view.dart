import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/utils/utils.dart';
import '../widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'login_view';
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
              child: const LoginViewBody().withHorizontalPadding(
                Constants.hp16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
