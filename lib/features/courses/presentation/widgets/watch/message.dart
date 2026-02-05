import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/extensions/padding_extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../data/models/discuss_model.dart';

class Message extends StatelessWidget {
  const Message({super.key, required this.discussion});
  final DiscussionModel discussion;
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
          Row(
            children: [
              const Icon(
                CupertinoIcons.hand_thumbsup,
                color: AppColors.primary,
              ),
              const Gap(8),
              Text(
                "10",
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
          ).withHorizontalPadding(Constants.hp16),
        ],
      ),
    );
  }
}
