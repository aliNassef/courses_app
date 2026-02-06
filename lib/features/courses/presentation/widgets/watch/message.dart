import 'package:courses_app/core/extensions/dialogs_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/extensions/padding_extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../../auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import '../../../data/models/discuss_model.dart';
import '../../view_model/discuss_cubit/discuss_cubit.dart';

class Message extends StatelessWidget {
  const Message({super.key, required this.discussion, required this.courseId});
  final DiscussionModel discussion;
  final String courseId;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: const Color(0xffeff6ff),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 24.r,
              backgroundImage: const NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkIeGP9yz73fbPNYvHwHjVpZaVozFT9XXAng&s',
              ),
            ),
            title: Text(
              "John Doe",
              style: context.appTheme.medium14.copyWith(
                color: AppColors.primary,
              ),
            ),
            subtitle: Text(
              "2 days ago",
              style: context.appTheme.medium12.copyWith(
                color: AppColors.primary.withValues(alpha: 0.5),
              ),
            ),
          ),
          Text(
            discussion.message,
            style: context.appTheme.medium14.copyWith(
              color: AppColors.mediumGrey,
            ),
          ).withHorizontalPadding(Constants.hp16),
          const Gap(16),
          BlocConsumer<DiscussCubit, DiscussState>(
            listenWhen: (previous, current) => current is ToggleLikeFailure,
            buildWhen: (previous, current) => current is ToggleLikeSuccess,
            listener: (context, state) {
              if (state is ToggleLikeFailure) {
                context.showErrorMessage(message: state.failure.errMessage);
              }
            },
            builder: (context, state) {
              return switch (state) {
                ToggleLikeSuccess(:final ids) => Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<DiscussCubit>().toggleLike(
                          courseId,
                          discussion.id,
                          context.read<AuthCubit>().userId,
                        );
                      },
                      child: Icon(
                        ids.contains(discussion.id) 
                            ? CupertinoIcons.hand_thumbsup_fill
                            : CupertinoIcons.hand_thumbsup,
                        color: AppColors.primary,
                      ),
                    ),
                    const Gap(8),
                    Text(
                      ids.contains(discussion.id)
                          ? (discussion.likes! + 1).toString()
                          : discussion.likes.toString(),
                      style: context.appTheme.medium14.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    const Gap(16),
                    const Icon(
                      CupertinoIcons.chat_bubble,
                      color: AppColors.primary,
                    ),
                    const Gap(8),
                    Text(
                      "10",
                      style: context.appTheme.medium14.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                _ => Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<DiscussCubit>().toggleLike(
                          courseId,
                          discussion.id,
                          context.read<AuthCubit>().userId,
                        );
                      },
                      child: const Icon(
                        CupertinoIcons.hand_thumbsup,
                        color: AppColors.primary,
                      ),
                    ),
                    const Gap(8),
                    Text(
                      discussion.likes.toString(),
                      style: context.appTheme.medium14.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    const Gap(16),
                    const Icon(
                      CupertinoIcons.chat_bubble,
                      color: AppColors.primary,
                    ),
                    const Gap(8),
                    Text(
                      "10",
                      style: context.appTheme.medium14.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              };
            },
          ).withHorizontalPadding(Constants.hp16),
        ],
      ),
    );
  }
}
