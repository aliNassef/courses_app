import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:courses_app/core/di/di.dart';
import 'package:courses_app/core/di/service_locator.dart';
import 'package:courses_app/core/extensions/padding_extension.dart';
import 'package:courses_app/core/utils/utils.dart';
import 'package:courses_app/features/wishlist/presentation/view_model/wishlist_cubit/wishlist_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/translations/locale_keys.g.dart';
import '../widgets/wish_list_view_body.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = context.read<AuthCubit>().userId;
    return AdaptiveScaffold(
      appBar: _buildWishListAppbar(context),
      body: BlocProvider(
        create: (context) =>
            injector<WishlistCubit>()..getWishlistCourses(userId),
        child: const WishListViewBody(),
      ),
    );
  }

  AdaptiveAppBar _buildWishListAppbar(BuildContext context) {
    return AdaptiveAppBar(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          LocaleKeys.favorites.tr(),
          style: context.appTheme.semiBold20.copyWith(
            color: AppColors.black,
          ),
        ),

        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              LocaleKeys.edit.tr(),
              style: context.appTheme.regular14.copyWith(
                color: AppColors.grey,
              ),
            ),
          ).withHorizontalPadding(8),
        ],
      ),
      cupertinoNavigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.white,
        middle: Text(
          LocaleKeys.favorites.tr(),
          style: context.appTheme.semiBold20.copyWith(
            color: AppColors.black,
          ),
        ),
        trailing: TextButton(
          onPressed: () {},
          child: Text(
            LocaleKeys.edit.tr(),
            style: context.appTheme.regular14.copyWith(color: AppColors.grey),
          ),
        ).withHorizontalPadding(8),
      ),
    );
  }
}
