import 'package:courses_app/core/widgets/widgets.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/di/di.dart';
import '../../../../core/translations/locale_keys.g.dart';
import 'achivements_user_info.dart';

class UserCoursesAndAchievemnets extends StatelessWidget {
  const UserCoursesAndAchievemnets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCoursesCubit, UserCoursesState>(
      builder: (context, state) {
        return switch (state) {
          UserCoursesLoading() => Skeletonizer(
            enabled: true,
            child: Row(
              mainAxisAlignment: .spaceAround,
              children: [
                AchivementUserInfo(
                  number: '...',
                  text: LocaleKeys.courses.tr(),
                ),
                AchivementUserInfo(
                  number: '...',
                  text: LocaleKeys.achievements.tr(),
                ),
                AchivementUserInfo(
                  number: '0',
                  text: LocaleKeys.certs.tr(),
                ),
              ],
            ),
          ),
          UserCoursesFailure(:final failure) => CustomFailureWidget(
            meesage: failure.errMessage,
          ),
          UserCoursesSuccess(count: final coursesCount) => Row(
            mainAxisAlignment: .spaceAround,
            children: [
              AchivementUserInfo(
                number: coursesCount.toString(),
                text: LocaleKeys.courses.tr(),
              ),
              AchivementUserInfo(
                number: '0',
                text: LocaleKeys.achievements.tr(),
              ),
              AchivementUserInfo(
                number: '0',
                text: LocaleKeys.certs.tr(),
              ),
            ],
          ),
          UserCoursesInitial() => const SizedBox.shrink(),
        };
      },
    );
  }
}
