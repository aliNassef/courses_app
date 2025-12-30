import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/utils.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({
    super.key,
    required this.question,
    required this.action,
    this.onTap,
  });
  final String question;
  final String action;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        Text.rich(
          TextSpan(
            text: question,
            style: context.appTheme.bold12.copyWith(
              color: AppColors.grey,
            ),
            children: [
              TextSpan(
                recognizer: TapGestureRecognizer()..onTap = onTap,
                text: action,
                style: context.appTheme.bold12.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
