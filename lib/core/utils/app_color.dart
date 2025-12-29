import 'package:flutter/material.dart';

class AppColors {
  // Core palette
  static const Color primary = Color(0xFF137fec);
  static const Color secondary = Color(0xFFF88E15);
  static const Color black = Color(0xFF111418);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF7c828f);
  static const Color lightGrey = Color(0xFFCFC1C1);
  static const Color mediumGrey = Color(0xFFA89D9D);
  static const Color paleGrey = Color(0xFFBAB1B1);
  static const Color backgroundColor = Color(0xFFf6f7f8);

  // Legacy/extra palette (kept for compatibility)
  static const Color orange = Color(0xFFF95B1C);
  static Color greyBackground = const Color(0xFF090F1F).withValues(alpha: 0.5);
  static const Color light = Color(0xFFF3F4F6);
  static const Color red = Color(0xFFEF2A39);
  static const Color brown = Color(0xFF3C2F2F);
  static const Color green = Color(0xFF3A813F);
  static Color greyBorder = const Color(0xff3b4cf2).withValues(alpha: 0.1);
}
