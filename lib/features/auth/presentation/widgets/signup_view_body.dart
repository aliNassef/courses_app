import 'package:courses_app/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/widgets.dart';
import 'have_account.dart';
import 'terms_and_conditions_with_checkbox.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: .start,
        children: [
          const Gap(32),
          Text(
            'Create Account',
            style: context.appTheme.bold20.copyWith(
              color: AppColors.black,
            ),
          ),
          const Gap(4),
          Text(
            'Start your journey to learning today',
            style: context.appTheme.regular12.copyWith(
              color: AppColors.grey,
            ),
          ),
          const Gap(24),
          Text(
            'Full Name',
            style: context.appTheme.medium14.copyWith(
              color: AppColors.black,
            ),
          ),
          const Gap(6),
          const CustomTextFormField(
            hintText: 'Enter your full name',
          ),
          const Gap(12),
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
            hintText: 'Create a password',
          ),
          const Gap(24),
          const TermsAndConditionsWithCheckBox(),
          const Gap(36),
          DefaultAppButton(
            text: 'Create Account',
            onPressed: () {},
          ),
          const Gap(30),
          HaveAccount(
            question: 'Already have an account? ',
            action: 'Log In',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
