import 'package:courses_app/core/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/navigation/navigation.dart';
import '../../../../../core/utils/utils.dart';
import '../../sections_enum.dart';

class TabsLessonsNotesDiscuss extends StatelessWidget {
  const TabsLessonsNotesDiscuss({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: TabBar(
        onTap: (index) {
          if (index == 0) {
            context.read<CourseWatchCubit>().onTapSections(Sections.lessons);
          } else if (index == 1) {
            context.read<CourseWatchCubit>().onTapSections(Sections.notes);
          } else if (index == 2) {
            context.read<CourseWatchCubit>().onTapSections(Sections.discuss);
          }
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
