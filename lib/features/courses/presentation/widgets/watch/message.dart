import 'package:courses_app/features/courses/presentation/view_model/reply_cubit/reply_state.dart';
import 'package:courses_app/features/courses/presentation/widgets/watch/likes_replies_bloclistener.dart';
import 'package:courses_app/features/courses/presentation/widgets/watch/reply_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/extensions/padding_extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../data/models/discuss_model.dart';
import '../../view_model/reply_cubit/reply_cubit.dart';

class Message extends StatelessWidget {
  const Message({
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
    return Column(
      crossAxisAlignment: .end,
      children: [
        Container(
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
              LikesRepliesBlocListener(
                discussion: discussion,
                courseId: courseId,
                onReply: () {
                  onReply!();
                },
              ),
            ],
          ),
        ),

        BlocBuilder<ReplyCubit, ReplyUiState>(
          buildWhen: (previous, current) =>
              current.state == ReplyState.loading &&
                  current.discussionId == discussion.id ||
              current.state == ReplyState.failure &&
                  current.discussionId == discussion.id ||
              current.state == ReplyState.success &&
                  current.discussionId == discussion.id,
          builder: (context, state) {
            if (state.state == ReplyState.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.state == ReplyState.failure) {
              return Center(child: Text(state.errorMessage!));
            }

            return Column(
              children: List.generate(
                state.replies.length,
                (index) => ReplyItem(reply: state.replies[index]),
              ),
            );
          },
        ),
      ],
    );
  }
}
