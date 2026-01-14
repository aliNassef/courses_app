import 'package:courses_app/core/extensions/mediaquery_size.dart';
import 'package:courses_app/core/extensions/padding_extension.dart';
import 'package:courses_app/core/widgets/widgets.dart';
import 'package:courses_app/features/my_learning/data/model/my_learning_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/translations/locale_keys.g.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/title_with_see_all.dart';
import '../view_model/mylearning_cubit/my_leaning_cubit.dart';
import 'continue_learning_section.dart';
import 'in_progress_card_item.dart';

class MyLearningViewBody extends StatelessWidget {
  const MyLearningViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height,
      color: AppColors.white,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                const Divider(),
                const Gap(16),
                TitleWithSeeAll(
                  title: LocaleKeys.continue_learning.tr(),
                  hasIcon: false,
                ).withHorizontalPadding(Constants.hp16),
                const Gap(16),
                SizedBox(height: 200.h, child: const ContinueLearningSection()),
                const Gap(16),
                Text(
                  LocaleKeys.in_progress.tr(),
                  style: context.appTheme.bold20,
                ).withHorizontalPadding(Constants.hp16),
                const Gap(16),
              ],
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: Constants.hp16),
            sliver: BlocBuilder<MyLearningCubit, MyLearningState>(
              buildWhen: (previous, current) =>
                  current is MyLearningSuccess ||
                  current is MyLearningLoading ||
                  current is MyLearningFailure,
              builder: (context, state) {
                if (state is MyLearningLoading) {
                  return SliverSkeletonizer(
                    enabled: true,
                    child: SliverList.separated(
                      itemBuilder: (_, _) => InProgreeCardItem(
                        learning: MyLearningModel(
                          courseId: 'course_001',
                          courseTitle: 'Flutter From Zero to Hero',
                          courseImage:
                              'https://tse3.mm.bing.net/th/id/OIP.Wwk-gQuVkQHi8a5qiNXY9AHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
                          progress: 35.0,
                          completedLessons: 7,
                          totalLessons: 20,
                          lastLessonId: 'lesson_07',
                          status: 'ongoing',
                          enrolledAt: DateTime.now().subtract(
                            const Duration(days: 10),
                          ),
                          updatedAt: DateTime.now(),
                          instructorId: '',
                        ),
                      ),
                      separatorBuilder: (_, _) => const Gap(16),
                      itemCount: 5,
                    ),
                  );
                }

                if (state is MyLearningFailure) {
                  return SliverToBoxAdapter(
                    child: CustomFailureWidget(
                      meesage: state.failure.errMessage,
                    ),
                  );
                }

                if (state is MyLearningSuccess) {
                  return SliverList.separated(
                    itemBuilder: (context, index) => InProgreeCardItem(
                      learning: state.learning[index],
                    ),
                    separatorBuilder: (_, _) => const Gap(16),
                    itemCount: state.learning.length,
                  );
                }

                return const SliverToBoxAdapter(child: SizedBox.shrink());
              },
            ),
          ),
          const SliverGap(30),
        ],
      ),
    );
  }
}
