import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'core/di/di.dart';
import 'core/widgets/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/constants.dart';
import 'core/di/service_locator.dart';
import 'core/navigation/navigation.dart';
import 'core/utils/theme/app_theme.dart';

class CoursesApp extends StatelessWidget {
  const CoursesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Constants.appDesign,
      minTextAdapt: true,
      builder: (context, child) => BlocProvider(
        create: (context) => injector<AuthCubit>(),
        child: AdaptiveApp(
          title: Constants.appName,
          onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
          initialRoute: SplashView.routeName,
          materialLightTheme: AppTheme.materialLightTheme,
          cupertinoLightTheme: AppTheme.cupertinoLightTheme,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1),
            ),
            child: child!,
          ),
        ),
      ),
    );
  }
}
