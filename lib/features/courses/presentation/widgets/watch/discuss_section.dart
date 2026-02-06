import 'package:courses_app/core/di/di.dart';
import 'package:courses_app/core/extensions/padding_extension.dart';
import 'package:courses_app/core/widgets/custom_text_form_field.dart';
import 'package:courses_app/features/courses/presentation/view_model/discuss_cubit/discuss_cubit.dart';
import 'package:flutter/cupertino.dart';
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
  @override
  void initState() {
    super.initState();
    context.read<DiscussCubit>().getDiscussions(widget.courseId);
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Row(
          children: [
            Expanded(
              child: SizedBox(
                child: CustomTextFormField(
                  controller: _controller,
                  hintText: 'Ask a question',
                  maxLines: 3,
                ),
              ),
            ),
            const Gap(16),
            GestureDetector(
              onTap: () {
                if (_controller.text.isNotEmpty) {
                  var discussion = DiscussionModel(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    userId: context.read<AuthCubit>().userId,
                    createdAt: DateTime.now(),
                    likes: null,
                    message: _controller.text.trim(),
                    userImage: '',
                    userName: '',
                    lessonId: '',
                  );
                  context.read<DiscussCubit>().addDiscussion(
                    widget.courseId,
                    discussion,
                  );
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
