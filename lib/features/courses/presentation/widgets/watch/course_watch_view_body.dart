import 'package:courses_app/features/courses/presentation/widgets/watch/discuss_section.dart';

import '../../../../../core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/di.dart';
import '../../enums/sections_enum.dart';
import 'course_lessons_list_bloc_builder.dart';
import 'course_video_and_meta_data.dart';
import 'course_watch_loading_skeleton.dart';

class CourseWatchViewBody extends StatefulWidget {
  const CourseWatchViewBody({super.key, required this.courseId});
  final String courseId;

  @override
  State<CourseWatchViewBody> createState() => _CourseWatchViewBodyState();
}

class _CourseWatchViewBodyState extends State<CourseWatchViewBody> {
  final sections = ValueNotifier<Sections>(Sections.lessons);
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final cubit = context.read<CourseWatchCubit>();
    final userId = context.read<AuthCubit>().userId;

    await cubit.init(widget.courseId, userId);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BlocBuilder<CourseWatchCubit, CourseWatchState>(
            buildWhen: (previous, current) =>
                current is GetSpecificLessonLoading ||
                current is GetSpecificLessonSuccess ||
                current is GetSpecificLessonError,
            builder: (context, state) {
              if (state is GetSpecificLessonError) {
                return CustomFailureWidget(meesage: state.failure.errMessage);
              }
              if (state is GetSpecificLessonLoading) {
                return const CourseWatchLoadingSkeleton();
              }

              if (state is GetSpecificLessonSuccess) {
                return CourseVideoAndMetaData(
                  lesson: state.lesson,
                  courseId: widget.courseId,
                  sections: sections,
                );
              }
              return const SizedBox.shrink();
            },
          ),
          ValueListenableBuilder(
            valueListenable: sections,
            builder: (context, state, child) {
              return switch (state) {
                Sections.lessons => CourseLessonsListBlocBuilder(
                  courseId: widget.courseId,
                ),
                Sections.discuss => DiscussSection(courseId: widget.courseId),
                Sections.notes => const SizedBox.shrink(),
              };
            },
          ),
        ],
      ),
    );
  }
}
