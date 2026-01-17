import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/navigation/navigation.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({
    super.key,
  });

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<AuthCubit>().checkAuthState();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is Authenticated || current is UnAuthenticated,
      listener: (context, state) {
        if (state is Authenticated) {
          context.pushReplacementNamed(LayoutView.routeName);
        }
        if (state is UnAuthenticated) {
          context.pushReplacementNamed(LoginView.routeName);
        }
      },
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
