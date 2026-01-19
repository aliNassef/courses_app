import 'package:courses_app/core/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/utils.dart';

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
              LocaleKeys.lessons.tr(),
              style: context.appTheme.medium12.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
          Tab(
            child: Text(
              LocaleKeys.notes.tr(),
              style: context.appTheme.medium12.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
          Tab(
            child: Text(
              LocaleKeys.discuss.tr(),
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
