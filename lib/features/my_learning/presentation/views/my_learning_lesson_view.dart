import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';
import 'package:omni_video_player/omni_video_player.dart';

import '../../../../core/extensions/mediaquery_size.dart';
import '../../../courses/data/models/lesson_model.dart';

class MyLearningLessonView extends StatefulWidget {
  const MyLearningLessonView({super.key, required this.lesson});
  static const String routeName = 'my_learning_lesson_view';
  final LessonModel lesson;

  @override
  State<MyLearningLessonView> createState() => _MyLearningLessonViewState();
}

class _MyLearningLessonViewState extends State<MyLearningLessonView> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      body: SafeArea(
        child: SizedBox(
          height: context.height,
          width: context.width,
          child: OmniVideoPlayer(
            configuration: VideoPlayerConfiguration(
              videoSourceConfiguration: VideoSourceConfiguration.youtube(
                videoUrl: Uri.parse(widget.lesson.videoUrl),
                preferredQualities: [OmniVideoQuality.high720],
              ),
            ),

            callbacks: const VideoPlayerCallbacks(),
          ),
        ),
      ),
    );
  }
}
