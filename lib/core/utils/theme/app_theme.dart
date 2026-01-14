import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_color.dart';
import 'app_text_style.dart';

class AppTheme {
  static final CupertinoThemeData cupertinoLightTheme = CupertinoThemeData(
    brightness: Brightness.light,

    primaryColor: AppColors.primary,
    primaryContrastingColor: AppColors.grey,

    scaffoldBackgroundColor: AppColors.backgroundColor,

    barBackgroundColor: CupertinoColors.white.withValues(alpha: 0.95),

    textTheme: CupertinoTextThemeData(
      textStyle: GoogleFonts.tajawal(
        fontSize: 14,
        color: AppColors.black,
      ),
      navTitleTextStyle: GoogleFonts.tajawal(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
      ),
      navLargeTitleTextStyle: GoogleFonts.tajawal(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
      actionTextStyle: GoogleFonts.tajawal(
        fontSize: 16,
        color: AppColors.primary,
      ),
    ),
  );
  static ThemeData materialLightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    textTheme: GoogleFonts.tajawalTextTheme(),
    primarySwatch: Colors.green,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    popupMenuTheme: PopupMenuThemeData(
      color: AppColors.grey.withValues(alpha: 0.5),
      iconColor: AppColors.primary,
      labelTextStyle: WidgetStatePropertyAll(
        GoogleFonts.tajawal(
          fontSize: 15,
          color: AppColors.primary,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      circularTrackColor: AppColors.primary,
      color: AppColors.grey,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: AppColors.lightGrey,
      selectionHandleColor: AppColors.primary,
      cursorColor: AppColors.primary,
    ),
    menuTheme: const MenuThemeData(
      style: MenuStyle(
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.primary,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarContrastEnforced: false,
      ),
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      elevation: 0,
      leadingWidth: 0,
    ),

    iconTheme: const IconThemeData(color: AppColors.white),

    extensions: [AppTextStyle.light],
  );
}
