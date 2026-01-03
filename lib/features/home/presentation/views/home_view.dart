import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:courses_app/core/di/service_locator.dart';
import 'package:courses_app/features/courses/presentation/view_model/courses_cubit/courses_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => injector<CoursesCubit>()..getAllCourses(),
          child: const HomeViewBody(),
        ),
      ),
    );
  }
}
