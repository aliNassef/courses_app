import 'package:courses_app/features/courses/data/models/discuss_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/extensions/dialogs_extensions.dart';
import '../../../../../core/extensions/padding_extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../view_model/discuss_cubit/discuss_cubit.dart';
import '../../view_model/reply_cubit/reply_cubit.dart';

class LikesRepliesBlocListener extends StatelessWidget {
  const LikesRepliesBlocListener({
    super.key,
    required this.discussion,
    required this.courseId,
    required this.onReply,
  });
  final DiscussionModel discussion;
  final String courseId;
  final void Function()? onReply;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DiscussCubit, DiscussState>(
      listenWhen: (previous, current) => current is ToggleLikeFailure,
      buildWhen: (previous, current) =>
          current is ToggleLikeSuccess || current is ToggleLikeLoading,
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
              GestureDetector(
                onTap: () {
                  onReply!();
                },
                child: const Icon(
                  CupertinoIcons.chat_bubble,
                  color: AppColors.primary,
                ),
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
          ToggleLikeLoading() => Skeletonizer(
            enabled: true,
            child: Row(
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
              GestureDetector(
                onTap: () {
                  context.read<ReplyCubit>().getReplies(
                    courseId,
                    discussion.id,
                  );
                },
                child: const Icon(
                  CupertinoIcons.chat_bubble,
                  color: AppColors.primary,
                ),
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
    ).withHorizontalPadding(Constants.hp16);
  }
}
