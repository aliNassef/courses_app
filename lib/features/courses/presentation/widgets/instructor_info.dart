import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/widgets.dart';

class InstructorInfo extends StatelessWidget {
  const InstructorInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AdaptiveListTile(
      title: Text(
        'Ali Nassef',
        style: context.appTheme.bold14,
      ),
      subtitle: Text(
        'Senior Mobile Developer @Google',
        style: context.appTheme.regular12.copyWith(
          color: AppColors.grey,
        ),
      ),
      trailing: const Icon(
        CupertinoIcons.forward,
        color: AppColors.grey,
      ),
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundImage: const AssetImage(
              AppAssets.profile,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(4.r),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
              ),
              child: const Icon(
                Icons.check,
                color: AppColors.white,
                size: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
