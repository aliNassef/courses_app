// Add this inside your file or a preview_utils.dart
import 'package:flutter/material.dart';

import '../../di/di.dart';
import '../../di/service_locator.dart';
import '../app_starter.dart';

Widget previewWrapper(Widget child) {
  if (!injector.isRegistered<AuthCubit>()) {
    AppStarter.start();
  }

  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(),
    home: FutureBuilder(
      // Only call setup if not already registered to prevent re-initialization
      future: injector.isRegistered<AuthCubit>()
          ? Future.value(true)
          : AppStarter.start(),
      builder: (context, snapshot) {
        // 1. While DI is loading, show a centered spinner in the preview
        if (snapshot.connectionState != ConnectionState.done) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // 2. If DI fails, show the error in the preview window
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('DI Error: ${snapshot.error}')),
          );
        }

        // 3. DI is ready, render the actual ProfileView
        return child;
      },
    ),
  );
}
