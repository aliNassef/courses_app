import '../../../../core/di/di.dart';
import '../../../../core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/translations/locale_keys.g.dart';
import '../../../../core/navigation/navigation.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../views/login_view.dart';
import 'have_account.dart';
import 'signup_button_bloc_listener.dart';
import 'terms_and_conditions_with_checkbox.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _fullNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
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
            controller: _fullNameController,
            hintText: LocaleKeys.enter_your_full_name.tr(),
            validator: Validators.fullNameValidator,
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
            controller: _passwordController,
            hintText: LocaleKeys.create_a_password.tr(),
            validator: Validators.passwordValidator,
          ),
          const Gap(24),
          TermsAndConditionsWithCheckBox(
            onChanged: (value) {
              context.read<AuthCubit>().acceptTermsAndConditions(value);
            },
          ),
          const Gap(36),
          SignupButtonBlocListener(
            formKey: _formKey,
            fullNameController: _fullNameController,
            emailController: _emailController,
            passwordController: _passwordController,
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
