import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/widgets/widgets.dart';
import '../../../courses/data/models/lesson_model.dart';
import '../view_model/mylearning_cubit/my_leaning_cubit.dart';
import 'continue_learning_section_item.dart';

class ContinueLearningSection extends StatelessWidget {
  const ContinueLearningSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyLearningCubit, MyLearningState>(
      buildWhen: (previous, current) =>
          current is GetLastCompletedLessonDetailsLoading ||
          current is GetLastCompletedLessonDetailsSuccess ||
          current is GetLastCompletedLessonDetailsError,
      builder: (context, state) {
        if (state is GetLastCompletedLessonDetailsLoading) {
          return _buildContinueLearningLoading();
        }

        if (state is GetLastCompletedLessonDetailsError) {
          return CustomFailureWidget(
            meesage: state.failure.errMessage,
          );
        }

        if (state is GetLastCompletedLessonDetailsSuccess) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => ContinueLearningSectionItem(
              learning: state.lessons[index],
            ),
            separatorBuilder: (_, _) => const Gap(8),
            itemCount: state.lessons.length,
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Skeletonizer _buildContinueLearningLoading() {
    return Skeletonizer(
      enabled: true,
      containersColor: Colors.grey.shade50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, _) => ContinueLearningSectionItem(
          learning: LessonModel(
            description:
                'industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic',
            id: 'lesson_1',
            name: 'Introduction to Flutter',
            videoUrl: 'https://www.youtube.com/watch?v=0mtA8rSXzuQ',
            duration: 600, // seconds
            order: 1,
            isCompleted: false,
          ),
        ),
        separatorBuilder: (_, _) => const Gap(8),
        itemCount: 5,
      ),
    );
  }
}
