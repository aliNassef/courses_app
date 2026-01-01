import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:courses_app/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../extensions/mediaquery_size.dart';
import '../utils/utils.dart';

class DefaultAppButton extends StatelessWidget {
  const DefaultAppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.bgColor,
    this.textColor,
    this.radius,
    this.width,
  });
  final String text;
  final Function()? onPressed;
  final double? radius;
  final Color? bgColor;
  final Color? textColor;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return AdaptiveButton.child(
      color: bgColor ?? AppColors.primary,
      borderRadius: BorderRadius.circular(radius ?? 12.r),
      minSize: Size(width ?? context.width, 40.h),
      onPressed: onPressed,
      child: Text(
        text,
        style: context.appTheme.semiBold16.copyWith(
          color: textColor ?? AppColors.white,
        ),
      ),
    );
  }
}
