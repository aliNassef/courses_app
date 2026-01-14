import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import '../widgets/profile_view_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdaptiveScaffold(
      body: SafeArea(
        child: ProfileViewBody(),
      ),
    );
  }
}
