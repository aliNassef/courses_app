import 'package:flutter/material.dart';

import '../../../../core/utils/utils.dart';

class TabsLessonsNotesDiscuss extends StatelessWidget {
  const TabsLessonsNotesDiscuss({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: TabBar(
        dividerColor: Colors.transparent,
        indicatorColor: AppColors.primary,
        tabs: [
          Tab(
            child: Text(
              'Lessons',
              style: context.appTheme.medium12.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
          Tab(
            child: Text(
              'Notes',
              style: context.appTheme.medium12.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
          Tab(
            child: Text(
              'Discuss',
              style: context.appTheme.medium12.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
