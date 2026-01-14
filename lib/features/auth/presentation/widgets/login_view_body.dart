import '../../../../core/navigation/navigation.dart';
import '../views/forget_password_view.dart';
import '../views/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/translations/locale_keys.g.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import 'have_account.dart';
import 'login_button_bloc_listener.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
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
            controller: _emailController,
            hintText: LocaleKeys.enter_your_email.tr(),
            validator: Validators.emailValidator,
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
            controller: _passwordController,
            validator: Validators.passwordValidator,
            isPassowrd: true,
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
          LoginButtonBlocListener(
            formKey: _formKey,
            emailController: _emailController,
            passwordController: _passwordController,
          ),
          const Gap(30),
          HaveAccount(
            question: LocaleKeys.dont_have_an_account.tr(),
            action: LocaleKeys.sign_up.tr(),
            onTap: () => _goToSignup(context),
          ),
        ],
      ),
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
