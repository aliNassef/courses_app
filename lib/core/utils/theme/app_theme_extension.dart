import 'package:flutter/material.dart';

import 'app_text_style.dart';

extension AppThemeExtension on BuildContext {
  AppTextStyle get typography => Theme.of(this).extension<AppTextStyle>()!;
}
