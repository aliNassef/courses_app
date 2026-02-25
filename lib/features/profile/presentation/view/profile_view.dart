import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:courses_app/core/di/di.dart';
import 'package:flutter/widget_previews.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_locator.dart';
import '../view_model/update_user_profile_image_cubit/update_user_profile_image_cubit.dart';
import '../widgets/profile_view_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  @Preview(
    group: 'profile_view',
  )
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    final userId = injector<AuthCubit>().userId;
    return AdaptiveScaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  injector<UserCoursesCubit>()..getUserCoursesCount(userId),
            ),
            BlocProvider(
              create: (context) => injector<UpdateUserProfileImageCubit>(),
            ),
          ],
          child: const ProfileViewBody(),
        ),
      ),
    );
  }
}
