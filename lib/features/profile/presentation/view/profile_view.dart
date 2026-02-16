import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:courses_app/core/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_locator.dart';
import '../widgets/profile_view_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = injector<AuthCubit>().userId;
    return AdaptiveScaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) =>
              injector<UserCoursesCubit>()..getUserCoursesCount(userId),
          child: const ProfileViewBody(),
        ),
      ),
    );
  }
}
