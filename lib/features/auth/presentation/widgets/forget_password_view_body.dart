import 'package:courses_app/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/translations/locale_keys.g.dart';

import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/widgets.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(48),
        CircleAvatar(
          radius: 30.r,
          backgroundColor: const Color(0xffe7f2fd),
          child: const Icon(
            Icons.lock_reset_outlined,
            color: Color(0xff007acc),
            size: 40,
          ),
        ),
        const Gap(20),
        Text(
          LocaleKeys.forgot_password_title.tr(),
          style: context.appTheme.bold24.copyWith(
            color: AppColors.black,
          ),
        ),
        const Gap(20),
        Text(
          LocaleKeys.forgot_password_description.tr(),
          style: context.appTheme.medium14.copyWith(
            color: AppColors.grey,
          ),
          textAlign: TextAlign.center,
        ),
        const Gap(20),
        Row(
          mainAxisAlignment: .start,
          children: [
            Text(
              LocaleKeys.email_address.tr(),
              style: context.appTheme.medium14.copyWith(
                color: AppColors.black,
              ),
            ),
          ],
        ),
        const Gap(4),
        CustomTextFormField(
          hintText: LocaleKeys.email_address.tr(),
        ),
        const Gap(50),
        DefaultAppButton(
          text: LocaleKeys.send_reset_link.tr(),
          onPressed: () {},
        ),
      ],
    );
  }
}
