import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import '../../../../core/extensions/dialogs_extensions.dart';
import '../../../../core/navigation/navigation.dart';
import '../../../auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/widgets.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is AuthFailure ||
          current is UnAuthenticated ||
          current is AuthLoading,
      listener: (context, state) {
        if (state is AuthFailure) {
          context.pop();
          context.showErrorMessage(message: state.failure.errMessage);
        }
        if (state is UnAuthenticated) {
          context.pushAndRemoveUntil(
            LoginView.routeName,
            (route) => false,
            arguments: const NavArgs(
              animation: NavAnimation.fade,
            ),
          );
        }
        if (state is AuthLoading) {
          context.showLoadingDialog();
        }
      },
      child: AdaptiveButton.child(
        style: AdaptiveButtonStyle.filled,
        size: AdaptiveButtonSize.large,
        minSize: Size(context.width, kToolbarHeight),
        borderRadius: BorderRadius.circular(12.r),
        color: const Color(0xfffef2f2),
        child: Text(
          'Log Out',
          style: context.appTheme.bold16.copyWith(color: AppColors.red),
        ),
        onPressed: () {
          context.read<AuthCubit>().signOut();
        },
      ),
    );
  }
}
