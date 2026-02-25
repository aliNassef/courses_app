import 'dart:io';

import 'package:courses_app/core/extensions/dialogs_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:flutter/cupertino.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import '../view_model/update_user_profile_image_cubit/update_user_profile_image_cubit.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    this.imageUrl,
  });
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<
      UpdateUserProfileImageCubit,
      UpdateUserProfileImageState
    >(
      listener: (context, state) {
        if (state is UpdateUserProfileImageFailure) {
          context.showErrorMessage(message: state.failure.errMessage);
        }
        if (state is PickedUserProfileImage) {
          updateImage(context);
        }
      },
      builder: (context, state) {
        return switch (state) {
          UpdateUserProfileImageInitial() => UserProfileImage(
            imageUrl: imageUrl,
            onTap: () {
              context.read<UpdateUserProfileImageCubit>().pickImage();
            },
          ),
          UpdateUserProfileImageLoading() => Skeletonizer(
            enabled: true,
            child: UserProfileImage(imageUrl: imageUrl),
          ),
          PickedUserProfileImage(:final File image) => UserProfileImage(
            image: image,
            onTap: () {
              context.read<UpdateUserProfileImageCubit>().pickImage();
            },
          ),
          UpdateUserProfileImageSuccess(:final String? imageUrl) =>
            UserProfileImage(
              imageUrl: imageUrl,
              onTap: () {
                context.read<UpdateUserProfileImageCubit>().pickImage();
              },
            ),
          UpdateUserProfileImageFailure() => UserProfileImage(
            imageUrl: imageUrl,
            onTap: () {
              context.read<UpdateUserProfileImageCubit>().pickImage();
            },
          ),
        };
      },
    );
  }

  void updateImage(BuildContext context) {
    final userId = context.read<AuthCubit>().userId;
    context.read<UpdateUserProfileImageCubit>().updateProfileImage(
      userId,
    );
  }
}

class UserProfileImage extends StatelessWidget {
  const UserProfileImage({
    super.key,
    this.image,
    this.imageUrl,
    this.onTap,
  });
  final File? image;
  final String? imageUrl;
  final void Function()? onTap;

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
              image: _getImageProvider(),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 15.h,
          right: 10.w,
          child: GestureDetector(
            onTap: onTap,
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
        ),
      ],
    );
  }

  ImageProvider _getImageProvider() {
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return NetworkImage(imageUrl!);
    } else if (image != null) {
      return FileImage(image!);
    } else {
      return const AssetImage(AppAssets.profile);
    }
  }
}
