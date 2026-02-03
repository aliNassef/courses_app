import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'core/utils/app_starter.dart';
import 'core/constants/constants.dart';
import 'courses_app.dart';

void main() async {
  await AppStarter.start();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => EasyLocalization(
        supportedLocales: [
          const Locale(Constants.en),
        const Locale(Constants.ar),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale(Constants.en),
        child: const CoursesApp(),
      ),
    ),
  );
}
