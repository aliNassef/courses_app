import 'package:courses_app/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/widgets.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(48),
        CircleAvatar(
          radius: 30.r,
          backgroundColor: const Color(0xffe7f2fd),
          child: const Icon(
            Icons.lock_reset_outlined,
            color: Color(0xff007acc),
            size: 40,
          ),
        ),
        const Gap(20),
        Text(
          'Forgot Password?',
          style: context.appTheme.bold24.copyWith(
            color: AppColors.black,
          ),
        ),
        const Gap(20),
        Text(
          'Don\'t worry! It happens. Please enter your email associated with your account and we will send you a link to reset your password.',
          style: context.appTheme.medium14.copyWith(
            color: AppColors.grey,
          ),
          textAlign: TextAlign.center,
        ),
        const Gap(20),
        Row(
          mainAxisAlignment: .start,
          children: [
            Text(
              'Email Address',
              style: context.appTheme.medium14.copyWith(
                color: AppColors.black,
              ),
            ),
          ],
        ),
        const Gap(4),
        const CustomTextFormField(
          hintText: 'Email Address',
        ),
        const Gap(50),
        DefaultAppButton(
          text: 'Send Reset Link',
          onPressed: () {},
        ),
      ],
    );
  }
}
