import 'package:courses_app/features/courses/presentation/widgets/watch/course_lesson_card.dart';
import 'package:flutter/material.dart';
import '../../../../../core/logging/app_logger.dart';
import '../../../../../core/utils/utils.dart';
import '../../../data/models/chapter_model.dart';

class ChapterTileItem extends StatefulWidget {
  const ChapterTileItem({super.key, required this.chapters});
  final List<ChapterModel> chapters;
  @override
  State<ChapterTileItem> createState() => _ChapterTileItemState();
}

class _ChapterTileItemState extends State<ChapterTileItem> {
  ValueNotifier<int> isExpanded = ValueNotifier(-1);

  @override
  void dispose() {
    isExpanded.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isExpanded,
      builder: (context, value, child) {
        return ExpansionPanelList(
          expandIconColor: AppColors.mediumGrey,
          expansionCallback: (panelIndex, val) {
            AppLogger.info(isExpanded.value.toString());
            if (isExpanded.value == panelIndex) {
              isExpanded.value = -1;
            } else {
              isExpanded.value = panelIndex;
            }
          },
          dividerColor: AppColors.light,
          elevation: 0,
          children: widget.chapters
              .asMap()
              .entries
              .map(
                (entry) => ExpansionPanel(
                  isExpanded: isExpanded.value == entry.key,
                  backgroundColor: AppColors.white,
                  headerBuilder: (context, isExpanded) {
                    return ListTile(
                      title: Text(
                        "Chapter ${entry.key + 1}",
                        style: context.appTheme.medium14.copyWith(
                          color: AppColors.grey,
                        ),
                      ),
                      subtitle: Text(
                        entry.value.title,
                        style: context.appTheme.bold16.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    );
                  },
                  body: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: entry.value.lessons.map((lesson) {
                      return CourseLessonCard(
                        lesson: lesson,
                        isCompleted: true,
                      );
                    }).toList(),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
