import '../../../../core/extensions/strings_extensions.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/widgets.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    this.image,
  });
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 140.h,
          width: 140.w,
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(
              color: AppColors.white,
              width: 6,
            ),
            shape: BoxShape.circle,
            image: DecorationImage(
              image: !image.isNullOrEmpty
                  ? NetworkImage(image!)
                  : const AssetImage(AppAssets.profile),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 15.h,
          right: 10.w,
          child: Container(
            height: 40.h,
            width: 40.w,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.white,
                width: 6,
              ),
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(
              CupertinoIcons.camera_fill,
              size: 16.sp,
            ),
          ),
        ),
      ],
    );
  }
}
