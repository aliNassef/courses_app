import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/extensions/dialogs_extensions.dart';
import '../../../../core/navigation/navigation.dart';
import '../../../../core/translations/locale_keys.g.dart';
import '../../../../core/widgets/widgets.dart';
import '../../data/models/signup_request.dart';

class SignupButtonBlocListener extends StatelessWidget {
  const SignupButtonBlocListener({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController fullNameController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) : _formKey = formKey,
       _fullNameController = fullNameController,
       _emailController = emailController,
       _passwordController = passwordController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _fullNameController;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is AuthLoading ||
          current is AuthFailure ||
          current is AuthSuccess,
      listener: (context, state) {
        if (state is AuthLoading) {
          context.showLoadingDialog();
        } else if (state is AuthFailure) {
          context.pop();
          context.showErrorMessage(message: state.failure.errMessage);
        } else if (state is AuthSuccess) {
          context.pop();
          context.pushAndRemoveUntil(
            LayoutView.routeName,
            (route) => true,
            arguments: const NavArgs(
              animation: NavAnimation.fade,
            ),
          );
        }
      },
      child: DefaultAppButton(
        text: LocaleKeys.create_account.tr(),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            if (!_checkTermsAndConditions(context)) return;
            var signupRequest = SignupRequest(
              name: _fullNameController.text,
              email: _emailController.text,
              password: _passwordController.text,
            );

            context.read<AuthCubit>().signUp(signupRequest);
          }
        },
      ),
    );
  }

  bool _checkTermsAndConditions(BuildContext context) {
    if ((context.read<AuthCubit>().state is! AcceptTermsAndConditions) ||
        (context.read<AuthCubit>().state is AcceptTermsAndConditions &&
            !(context.read<AuthCubit>().state as AcceptTermsAndConditions)
                .termsAndConditions)) {
      context.showErrorMessage(
        message: "Please accept terms and conditions",
      );
      return false;
    }
    return true;
  }
}
