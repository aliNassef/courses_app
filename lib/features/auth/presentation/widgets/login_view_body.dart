import 'package:courses_app/core/navigation/app_navigation.dart';
import 'package:courses_app/core/navigation/navigation.dart';
import 'package:courses_app/features/auth/presentation/views/forget_password_view.dart';
import 'package:courses_app/features/auth/presentation/views/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/translations/locale_keys.g.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/default_app_button.dart';
import '../../../../core/widgets/widgets.dart';
import 'have_account.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        const Gap(32),
        Center(
          child: Text(
            LocaleKeys.welcome_back_title.tr(),
            style: context.appTheme.bold32.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
        const Gap(4),
        Center(
          child: Text(
            LocaleKeys.continue_your_learning_journey.tr(),
            style: context.appTheme.regular12.copyWith(
              color: AppColors.grey,
            ),
          ),
        ),
        const Gap(16),
        Text(
          LocaleKeys.email_address.tr(),
          style: context.appTheme.medium14.copyWith(
            color: AppColors.black,
          ),
        ),
        const Gap(6),
        CustomTextFormField(
          hintText: LocaleKeys.enter_your_email.tr(),
        ),
        const Gap(12),
        Text(
          LocaleKeys.password.tr(),
          style: context.appTheme.medium14.copyWith(
            color: AppColors.black,
          ),
        ),
        const Gap(6),
        CustomTextFormField(
          hintText: LocaleKeys.enter_your_password.tr(),
        ),
        const Gap(8),
        Row(
          mainAxisAlignment: .end,
          children: [
            TextButton(
              onPressed: () => _goToForgetPassword(context),
              child: Text(
                LocaleKeys.forgot_password_question.tr(),
                style: context.appTheme.regular12.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        const Gap(10),
        DefaultAppButton(
          text: LocaleKeys.log_in.tr(),
          onPressed: () {},
        ),
        const Gap(30),
        HaveAccount(
          question: LocaleKeys.dont_have_an_account.tr(),
          action: LocaleKeys.sign_up.tr(),
          onTap: () => _goToSignup(context),
        ),
      ],
    );
  }

  void _goToSignup(BuildContext context) {
    context.pushNamed(
      SignupView.routeName,
      arguments: const NavArgs(
        animation: NavAnimation.fade,
      ),
    );
  }

  void _goToForgetPassword(BuildContext context) {
    context.pushNamed(
      ForgetPasswordView.routeName,
      arguments: const NavArgs(
        animation: NavAnimation.fade,
      ),
    );
  }
}
