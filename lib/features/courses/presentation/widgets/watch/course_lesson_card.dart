import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/extensions/duration_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../../my_learning/presentation/view_model/mylearning_cubit/my_leaning_cubit.dart';
import '../../../data/models/lesson_model.dart';

class CourseLessonCard extends StatelessWidget {
  const CourseLessonCard({
    super.key,
    required this.lesson,
    required this.isCompleted,
  });
  final LessonModel lesson;
  final bool isCompleted;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: AdaptiveListTile(
        title: Text(
          lesson.name,
          style: context.appTheme.medium16.copyWith(
            color: isCompleted ? AppColors.grey : AppColors.black,
            decoration: isCompleted ? TextDecoration.lineThrough : null,
            decorationThickness: 2,
            decorationColor: AppColors.grey,
          ),
        ),
        subtitle: Text(
          lesson.duration.toHM,
          style: context.appTheme.regular14.copyWith(
            color: AppColors.grey,
          ),
        ),
        leading: BlocSelector<MyLearningCubit, MyLearningState, String?>(
          selector: (state) {
            if (state is OpenNextLesson) {
              return state.lessonId;
            }
            return null;
          },
          builder: (context, id) {
            return CircleAvatar(
              backgroundColor: const Color(0xffe7f2fd),
              child: isCompleted || id == lesson.id
                  ? const CircleAvatar(
                      backgroundColor: Color(0xffdcfce7),
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: AppColors.green,
                        child: Icon(
                          Icons.check,
                          color: AppColors.white,
                          size: 12,
                        ),
                      ),
                    )
                  : const Icon(
                      Icons.lock,
                      color: AppColors.primary,
                      size: 18,
                    ),
            );
          },
        ),
      ),
    );
  }
}
