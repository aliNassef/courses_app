import 'package:courses_app/core/widgets/custom_network_image.dart';
import 'package:flutter/material.dart';

class CustomThumbnailVideoImage extends StatefulWidget {
  const CustomThumbnailVideoImage({
    super.key,
    required this.videoUrl,
    this.width,
    this.height,
    this.radius = 0,
  });
  final String videoUrl;
  final double? width;
  final double? height;
  final double radius;
  @override
  State<CustomThumbnailVideoImage> createState() =>
      _CustomThumbnailVideoImageState();
}

class _CustomThumbnailVideoImageState extends State<CustomThumbnailVideoImage> {
  late final String img;

  @override
  void initState() {
    super.initState();
    img = _getYoutubeThumbnail(widget.videoUrl);
  }

  @override
  Widget build(BuildContext context) {
    return CustomNetworkImage(
      img: img,
      width: widget.width,
      height: widget.height,
      radius: widget.radius,
    );
  }

  String _getYoutubeThumbnail(String url) {
    final uri = Uri.parse(url);

    // standard youtube link
    if (uri.queryParameters.containsKey('v')) {
      return 'https://img.youtube.com/vi/${uri.queryParameters['v']}/0.jpg';
    }

    // youtu.be link
    if (uri.host.contains('youtu.be')) {
      return 'https://img.youtube.com/vi${uri.path}/0.jpg';
    }

    throw Exception('Invalid YouTube URL');
  }
}
