import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:courses_app/core/utils/app_color.dart';
import 'package:courses_app/features/profile/presentation/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/mediaquery_size.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      body: SafeArea(
        child: Container(
          color: AppColors.backgroundColor,
          height: context.height,
          width: context.width,
          child: const SingleChildScrollView(
            child: ProfileViewBody(),
          ),
        ),
      ),
    );
  }
}
