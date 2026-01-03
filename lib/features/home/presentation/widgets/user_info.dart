import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:courses_app/core/extensions/strings_extensions.dart';
import 'package:courses_app/core/widgets/custom_failure_widget.dart';
import 'package:courses_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:courses_app/features/cart/presentation/view/cart_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/navigation/navigation.dart';
import '../../../../core/translations/locale_keys.g.dart';
import '../../../../core/utils/utils.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (_, current) =>
          current is GetUserProfileFailure ||
          current is GetUserProfileLoading ||
          current is GetUserProfileLoaded,
      builder: (context, state) {
        if (state is GetUserProfileFailure) {
          return CustomFailureWidget(meesage: state.failure.errMessage);
        }

        if (state is GetUserProfileLoading) {
          return Skeletonizer(
            enabled: true,
            child: AdaptiveListTile(
              padding: EdgeInsets.zero,
              title: Text(
                LocaleKeys.welcome_back.tr(),
                style: context.appTheme.regular12.copyWith(
                  color: AppColors.grey,
                ),
              ),
              subtitle: Text(
                'Ali Nassef',
                style: context.appTheme.bold16.copyWith(
                  color: AppColors.black,
                ),
              ),
              trailing: Material(
                elevation: 2,
                shadowColor: AppColors.grey.withValues(alpha: 0.4),
                shape: const CircleBorder(),
                child: const CircleAvatar(
                  backgroundColor: AppColors.white,
                  radius: 21,
                  child: Icon(
                    CupertinoIcons.cart_fill,
                    color: AppColors.black,
                    size: 24,
                  ),
                ),
              ),
              leading: const CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage(AppAssets.profile),
              ),
            ),
          );
        }

        if (state is GetUserProfileLoaded) {
          return AdaptiveListTile(
            padding: EdgeInsets.zero,
            title: Text(
              LocaleKeys.welcome_back.tr(),
              style: context.appTheme.regular12.copyWith(
                color: AppColors.grey,
              ),
            ),
            subtitle: Text(
              state.user.name,
              style: context.appTheme.bold16.copyWith(
                color: AppColors.black,
              ),
            ),
            trailing: Material(
              elevation: 2,
              shadowColor: AppColors.grey.withValues(alpha: 0.4),
              shape: const CircleBorder(),
              child: CircleAvatar(
                backgroundColor: AppColors.white,
                radius: 21,
                child: GestureDetector(
                  onTap: () {
                    context.pushNamed(
                      CartView.routeName,
                      arguments: const NavArgs(
                        animation: NavAnimation.fade,
                      ),
                    );
                  },
                  child: const Icon(
                    CupertinoIcons.cart_fill,
                    color: AppColors.black,
                    size: 24,
                  ),
                ),
              ),
            ),
            leading: CircleAvatar(
              radius: 22,
              backgroundImage: !state.user.image.isNullOrEmpty
                  ? NetworkImage(state.user.image!)
                  : const AssetImage(AppAssets.profile),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
