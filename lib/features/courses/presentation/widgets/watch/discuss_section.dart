import 'package:courses_app/core/di/di.dart';
import 'package:courses_app/core/extensions/padding_extension.dart';
import 'package:courses_app/core/logging/app_logger.dart';
import 'package:courses_app/core/widgets/custom_text_form_field.dart';
import 'package:courses_app/features/courses/data/models/reply_model.dart';
import 'package:courses_app/features/courses/presentation/view_model/discuss_cubit/discuss_cubit.dart';
import 'package:courses_app/features/courses/presentation/view_model/reply_cubit/reply_cubit.dart';
import 'package:courses_app/features/courses/presentation/view_model/reply_cubit/reply_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../data/models/discuss_model.dart';
import 'message.dart';

class DiscussSection extends StatefulWidget {
  const DiscussSection({super.key, required this.courseId});
  final String courseId;
  @override
  State<DiscussSection> createState() => _DiscussSectionState();
}

class _DiscussSectionState extends State<DiscussSection> {
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    context.read<DiscussCubit>().getDiscussions(widget.courseId);
    context.read<DiscussCubit>().loadMyLikes(
      widget.courseId,
      context.read<AuthCubit>().userId,
    );
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _prepareReply(String discussionId, ReplyModel reply) {
    final replyCubit = context.read<ReplyCubit>();
    if (replyCubit.state.state == ReplyState.initial) {
      replyCubit.getReplies(widget.courseId, discussionId);
    }
    replyCubit.prepareReply(
      discussionId,
      reply,
    );
    _focusNode.requestFocus();
  }

  void _sendReply(String discussionId, ReplyModel reply) {
    context.read<ReplyCubit>().addReply(
      widget.courseId,
      discussionId,
      reply,
    );
  }

  void _cancelReply() {
    context.read<ReplyCubit>().cancelReply();
    _controller.clear();
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final replyState = context.read<ReplyCubit>().state;
    return Column(
      spacing: 16,
      children: [
        BlocBuilder<ReplyCubit, ReplyUiState>(
          buildWhen: (previous, current) =>
              current.state == ReplyState.addReply,
          builder: (context, state) {
            if (state.state == ReplyState.addReply) {
              return Container(
                padding: EdgeInsets.all(8.r),
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border(
                    left: BorderSide(color: AppColors.primary, width: 4.w),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Replying to ${replyState.replyingTo?.userName}',
                            style: context.appTheme.medium12.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            replyState.replyingTo?.message ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.appTheme.medium12.copyWith(
                              color: AppColors.mediumGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: _cancelReply,
                      icon: const Icon(Icons.close, size: 16),
                      color: AppColors.primary,
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
        BlocBuilder<ReplyCubit, ReplyUiState>(
          buildWhen: (previous, current) =>
              current.state == ReplyState.addReply,
          builder: (context, state) {
            return Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: CustomTextFormField(
                      controller: _controller,
                      focusNode: _focusNode,
                      hintText: state.state == ReplyState.addReply
                          ? 'Type a reply...'
                          : 'Ask a question',
                      maxLines: 3,
                    ),
                  ),
                ),
                const Gap(16),
                GestureDetector(
                  onTap: () {
                    if (_controller.text.isNotEmpty) {
                      final text = _controller.text.trim();
                      final userId = context.read<AuthCubit>().userId;

                      if (state.state == ReplyState.addReply) {
                        AppLogger.info('reply: $text');
                        final reply = ReplyModel(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          userId: userId,
                          createdAt: DateTime.now(),
                          message: text,
                          userImage: '',
                          userName: state.replyingTo!.userName,
                        );
                        _sendReply(state.discussionId!, reply);
                        _cancelReply();
                      } else {
                        AppLogger.info('discussion: $text');
                        var discussion = DiscussionModel(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          userId: userId,
                          createdAt: DateTime.now(),
                          likes: null,
                          message: text,
                          userImage: '',
                          userName: '',
                          lessonId: '',
                        );
                        context.read<DiscussCubit>().addDiscussion(
                          widget.courseId,
                          discussion,
                        );
                      }
                      _controller.clear();
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: const Icon(
                      CupertinoIcons.paperplane,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            );
          },
        ).withHorizontalPadding(Constants.hp16),
        BlocBuilder<DiscussCubit, DiscussState>(
          buildWhen: (previous, current) =>
              current is GetDiscussionsSuccess ||
              current is GetDiscussionsLoading ||
              current is GetDiscussionsFailure,
          builder: (context, state) {
            return switch (state) {
              GetDiscussionsSuccess() => ListView.separated(
                itemCount: state.discussions.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) => const Gap(16),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Message(
                    onReply: () {
                      _prepareReply(
                        state.discussions[index].id,
                        state.discussions[index].toReplyModel(),
                      );
                    },
                    discussion: state.discussions[index],
                    courseId: widget.courseId,
                  );
                },
              ),
              GetDiscussionsLoading() => Skeletonizer(
                enabled: true,
                child: ListView.separated(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => const Gap(16),
                  itemBuilder: (context, index) {
                    return Message(
                      onReply: () {},
                      courseId: '',
                      discussion: DiscussionModel(
                        id: 'id',
                        userId: '',
                        userName: '',
                        userImage: '',
                        message: 'aaaaaaaaaaaaaaaaaaaaaa',
                        createdAt: DateTime.now(),
                        likes: null,
                      ),
                    );
                  },
                ),
              ),
              GetDiscussionsFailure() => Center(
                child: Text(state.failure.errMessage),
              ),
              _ => const SizedBox.shrink(),
            };
          },
        ),
      ],
    );
  }
}
