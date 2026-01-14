import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:courses_app/core/extensions/strings_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/widgets.dart';
import '../view_model/instructor_cubit/instructor_cubit.dart';

class InstructorInfo extends StatelessWidget {
  const InstructorInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InstructorCubit, InstructorState>(
      buildWhen: (previous, current) =>
          current is InstructorLoaded ||
          current is InstructorError ||
          current is InstructorLoading,
      builder: (context, state) {
        if (state is InstructorError) {
          return CustomFailureWidget(meesage: state.failure.errMessage);
        }

        if (state is InstructorLoading) {
          return _buildLoadingInstructor(context);
        }
        if (state is InstructorLoaded) {
          return AdaptiveListTile(
            title: Text(
              state.instructor.name,
              style: context.appTheme.bold14,
            ),
            subtitle: Text(
              state.instructor.position,
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
                  backgroundImage: state.instructor.image.isNullOrEmpty
                      ? const AssetImage(
                          AppAssets.profile,
                        )
                      : NetworkImage(state.instructor.image),
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
        return const SizedBox.shrink();
      },
    );
  }

  Skeletonizer _buildLoadingInstructor(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: AdaptiveListTile(
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
      ),
    );
  }
}
