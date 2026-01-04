import 'package:courses_app/core/extensions/mediaquery_size.dart';
import 'package:flutter/material.dart';
import 'package:omni_video_player/omni_video_player.dart';

class CourseIntroVideo extends StatelessWidget {
  const CourseIntroVideo({super.key, required this.videoUrl});
  final String videoUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.3,
      width: context.width,
      child: OmniVideoPlayer(
        configuration: VideoPlayerConfiguration(
          videoSourceConfiguration: VideoSourceConfiguration.youtube(
            videoUrl: Uri.parse(videoUrl),
            preferredQualities: [OmniVideoQuality.high720],
          ),
        ),
        callbacks: const VideoPlayerCallbacks(),
      ),
    );
  }
}
