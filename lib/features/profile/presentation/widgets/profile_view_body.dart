import 'package:courses_app/core/constants/constants.dart';
import 'package:courses_app/core/extensions/padding_extension.dart';
import 'package:courses_app/core/extensions/strings_extensions.dart';
import 'package:courses_app/core/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/di/di.dart';
import '../../../../core/translations/locale_keys.g.dart';
import 'account_info.dart';
import 'achivements_user_info.dart';
import 'logout_button.dart';
import 'profile_image.dart';
import 'recent_achivements_items.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) =>
          current is GetUserProfileFailure ||
          current is GetUserProfileLoading ||
          current is GetUserProfileLoaded,

      builder: (context, state) {
        if (state is GetUserProfileLoading) {
          return _buildLoadingProfile(context);
        }
        if (state is GetUserProfileFailure) {
          return Center(child: Text(state.failure.errMessage));
        }
        if (state is GetUserProfileLoaded) {
          return Column(
            crossAxisAlignment: .start,
            children: [
              const Gap(10),
              Row(
                children: [
                  const Spacer(),
                  const Gap(32),
                  Text(
                    LocaleKeys.profile.tr(),
                    style: context.appTheme.bold16.copyWith(
                      color: AppColors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.edit_square,
                    color: AppColors.primary,
                  ),
                ],
              ),
              const Gap(16),
              Align(
                alignment: Alignment.center,
                child: ProfileImage(image: state.user.image),
              ),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    state.user.name,
                    style: context.appTheme.bold20.copyWith(
                      color: AppColors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const Gap(4),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    state.user.description.isNullOrEmpty
                        ? LocaleKeys.student.tr()
                        : state.user.description!,
                    style: context.appTheme.regular14.copyWith(
                      color: AppColors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const Gap(16),
              Row(
                mainAxisAlignment: .spaceAround,
                children: [
                  AchivementUserInfo(
                    number: state.user.numberOfCourses.toString(),
                    text: LocaleKeys.courses.tr(),
                  ),
                  AchivementUserInfo(
                    number: state.user.numberOfAchievements.toString(),
                    text: LocaleKeys.achievements.tr(),
                  ),
                  AchivementUserInfo(
                    number: state.user.numberOfCerts.toString(),
                    text: LocaleKeys.certs.tr(),
                  ),
                ],
              ),
              const Gap(16),
              Text(
                LocaleKeys.recent_achievements.tr(),
                style: context.appTheme.bold16.copyWith(
                  color: AppColors.black,
                ),
              ),
              const Gap(16),
              const RecentAchivementsItems(),
              const Gap(16),
              Text(
                LocaleKeys.account.tr(),
                style: context.appTheme.bold16.copyWith(
                  color: AppColors.black,
                ),
              ),
              const Gap(16),
              const AccountsInfo(),
              const Gap(16),
              const LogoutButton(),
              const Gap(30),
            ],
          ).withHorizontalPadding(Constants.hp16);
        }
        return const SizedBox.shrink();
      },
    );
  }

  Skeletonizer _buildLoadingProfile(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          const Gap(10),
          Row(
            children: [
              const Spacer(),
              const Gap(32),
              Text(
                LocaleKeys.profile.tr(),
                style: context.appTheme.bold16.copyWith(
                  color: AppColors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              const Icon(
                Icons.edit_square,
                color: AppColors.primary,
              ),
            ],
          ),
          const Gap(16),
          const Align(
            alignment: Alignment.center,
            child: ProfileImage(),
          ),
          Row(
            mainAxisAlignment: .center,
            children: [
              Text(
                'Ali Nassef',
                style: context.appTheme.bold20.copyWith(
                  color: AppColors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const Gap(4),
          Row(
            mainAxisAlignment: .center,
            children: [
              Text(
                'Computer Science Student',
                style: context.appTheme.regular14.copyWith(
                  color: AppColors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const Gap(16),
          Row(
            mainAxisAlignment: .spaceAround,
            children: [
              AchivementUserInfo(
                number: '12',
                text: LocaleKeys.courses.tr(),
              ),
              AchivementUserInfo(
                number: '12',
                text: LocaleKeys.achievements.tr(),
              ),
              AchivementUserInfo(
                number: '12',
                text: LocaleKeys.certs.tr(),
              ),
            ],
          ),
          const Gap(16),
          Text(
            LocaleKeys.recent_achievements.tr(),
            style: context.appTheme.bold16.copyWith(
              color: AppColors.black,
            ),
          ),
          const Gap(16),
          const RecentAchivementsItems(),
          const Gap(16),
          Text(
            LocaleKeys.account.tr(),
            style: context.appTheme.bold16.copyWith(
              color: AppColors.black,
            ),
          ),
          const Gap(16),
          const AccountsInfo(),
          const Gap(16),
          const LogoutButton(),
          const Gap(30),
        ],
      ).withHorizontalPadding(Constants.hp16),
    );
  }
}
