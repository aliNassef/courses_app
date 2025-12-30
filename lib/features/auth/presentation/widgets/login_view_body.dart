import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
            'Welcome Back',
            style: context.appTheme.bold32.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
        const Gap(4),
        Center(
          child: Text(
            'Continue your learning journey.',
            style: context.appTheme.regular12.copyWith(
              color: AppColors.grey,
            ),
          ),
        ),
        const Gap(16),
        Text(
          'Email Address',
          style: context.appTheme.medium14.copyWith(
            color: AppColors.black,
          ),
        ),
        const Gap(6),
        const CustomTextFormField(
          hintText: 'Enter your email',
        ),
        const Gap(12),
        Text(
          'Password',
          style: context.appTheme.medium14.copyWith(
            color: AppColors.black,
          ),
        ),
        const Gap(6),
        const CustomTextFormField(
          hintText: 'Enter your password',
        ),
        const Gap(8),
        Row(
          mainAxisAlignment: .end,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password?',
                style: context.appTheme.regular12.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        const Gap(10),
        DefaultAppButton(
          text: 'Log In',
          onPressed: () {},
        ),
        const Gap(30),
        HaveAccount(
          question: 'Don\'t have an account? ',
          action: 'Sign Up',
          onTap: () {},
        ),
      ],
    );
  }
}
