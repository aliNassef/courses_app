import 'package:courses_app/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/widgets/custom_failure_widget.dart';
import '../../../data/models/chapter_model.dart';
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
            courseId: widget.courseId,
            chapters: state.chapters,
            completedLessonsIds: widget.completedLessonsIds,
          ).withHorizontalPadding(10);
        }
        return const SizedBox.shrink();
      },
    );
  }

  Skeletonizer _buildLoadingCourseLesson() {
    return const Skeletonizer(
      enabled: true,
      child: ChapterTileItem(
        courseId: "",
        chapters: [ChapterModel(id: '1', title: 'Chapter 1', lessons: [])],
        completedLessonsIds: {},
      ),
    );
  }
}
