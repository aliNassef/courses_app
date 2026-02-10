import 'package:courses_app/core/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/utils.dart';
import '../../enums/sections_enum.dart';

class TabsLessonsNotesDiscuss extends StatelessWidget {
  const TabsLessonsNotesDiscuss({
    super.key,
    required this.sections,
  });
  final ValueNotifier<Sections> sections;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: TabBar(
        onTap: (index) {
          sections.value = SectionsMapper.fromIndex(index);
        },
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
