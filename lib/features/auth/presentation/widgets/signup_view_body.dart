import 'package:courses_app/core/navigation/nav_animation_enum.dart';
import 'package:courses_app/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/translations/locale_keys.g.dart';
import '../../../../core/navigation/navigation.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/widgets.dart';
import '../views/login_view.dart';
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
            LocaleKeys.create_account.tr(),
            style: context.appTheme.bold20.copyWith(
              color: AppColors.black,
            ),
          ),
          const Gap(4),
          Text(
            LocaleKeys.start_journey_learning_today.tr(),
            style: context.appTheme.regular12.copyWith(
              color: AppColors.grey,
            ),
          ),
          const Gap(24),
          Text(
            LocaleKeys.full_name.tr(),
            style: context.appTheme.medium14.copyWith(
              color: AppColors.black,
            ),
          ),
          const Gap(6),
          CustomTextFormField(
            hintText: LocaleKeys.enter_your_full_name.tr(),
          ),
          const Gap(12),
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
            hintText: LocaleKeys.create_a_password.tr(),
          ),
          const Gap(24),
          const TermsAndConditionsWithCheckBox(),
          const Gap(36),
          DefaultAppButton(
            text: LocaleKeys.create_account.tr(),
            onPressed: () {},
          ),
          const Gap(30),
          HaveAccount(
            question: LocaleKeys.already_have_an_account.tr(),
            action: LocaleKeys.log_in.tr(),
            onTap: () => _goToLogin(context),
          ),
        ],
      ),
    );
  }

  void _goToLogin(BuildContext context) {
    context.pushNamed(
      LoginView.routeName,
      arguments: const NavArgs(
        animation: NavAnimation.fade,
      ),
    );
  }
}
