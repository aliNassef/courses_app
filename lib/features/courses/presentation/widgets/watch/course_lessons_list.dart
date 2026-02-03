import 'package:courses_app/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/widgets/custom_failure_widget.dart';
import '../../view_model/course_watch_cubit/course_watch_cubit.dart';
import 'chapter_tile_item.dart';

class CourseLessonsList extends StatefulWidget {
  const CourseLessonsList({
    super.key,
    required this.courseId,
    required this.completedLessonsIds,
  });
  final String courseId;
  final Set<String> completedLessonsIds;
  @override
  State<CourseLessonsList> createState() => _CourseLessonsListState();
}

class _CourseLessonsListState extends State<CourseLessonsList> {
  @override
  void initState() {
    super.initState();
    context.read<CourseWatchCubit>().getChaptersByCourseId(widget.courseId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseWatchCubit, CourseWatchState>(
      buildWhen: (previous, current) =>
          current is GetChaptersByCourseIdSuccess ||
          current is GetChaptersByCourseIdError ||
          current is GetChaptersByCourseIdLoading,
      builder: (context, state) {
        if (state is GetChaptersByCourseIdLoading) {
          return _buildLoadingCourseLesson();
        }

        if (state is GetChaptersByCourseIdError) {
          return CustomFailureWidget(
            meesage: state.failure.errMessage,
          );
        }
        if (state is GetChaptersByCourseIdSuccess) {
          return ChapterTileItem(
            chapters: state.chapters,
          ).withHorizontalPadding(10);
          // return ListView.separated(
          //   padding: EdgeInsets.symmetric(
          //     horizontal: Constants.hp16,
          //   ),
          //   itemBuilder: (context, index) {
          //     return GestureDetector(
          //       onTap: () {
          //         context
          //             .read<CourseWatchCubit>()
          //             .getLessonsByCourseIdAndLessonNumber(
          //               widget.courseId,
          //               state.lessons[index].order,
          //             );
          //       },
          //       child: CourseLessonCard(
          //         isCompleted: widget.completedLessonsIds.contains(
          //           state.lessons[index].id,
          //         ),
          //         lesson: state.lessons[index],
          //       ),
          //     );
          //   },
          //   separatorBuilder: (context, index) {
          //     return const Gap(16);
          //   },
          //   itemCount: state.lessons.length,
          // );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Skeletonizer _buildLoadingCourseLesson() {
    return const Skeletonizer(
      enabled: true,
      child: ChapterTileItem(
        chapters: [],
      ),
    );
  }
}
