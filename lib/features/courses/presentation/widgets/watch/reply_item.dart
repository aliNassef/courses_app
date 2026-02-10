import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/extensions/mediaquery_size.dart';
import '../../../../../core/extensions/padding_extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../data/models/reply_model.dart';

class ReplyItem extends StatelessWidget {
  const ReplyItem({
    super.key,
    required this.reply,
  });
  final ReplyModel reply;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.7,
      margin: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Colors.teal.withValues(alpha: 0.2),
      ),
      child: Column(
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
            trailing: const Icon(
              CupertinoIcons.reply_all,
              color: AppColors.primary,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Text(
                  reply.message,
                  style: context.appTheme.medium14.copyWith(
                    color: AppColors.black.withValues(alpha: 0.5),
                  ),
                ).withHorizontalPadding(Constants.hp16),
              ),
            ],
          ),
          const Gap(10),
        ],
      ),
    );
  }
}
