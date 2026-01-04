import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:courses_app/core/utils/app_starter.dart';
import 'core/constants/constants.dart';
import 'courses_app.dart';

void main() async {
  await AppStarter.start();
  runApp(
    EasyLocalization(
      supportedLocales: [ 
        const Locale(Constants.en),
        const Locale(Constants.ar),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale(Constants.en),
      child: const CoursesApp(),
    ),
  );
}
