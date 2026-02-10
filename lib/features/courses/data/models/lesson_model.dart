import 'package:equatable/equatable.dart';

class LessonModel extends Equatable {
  final String id;
  final String name;
  final String videoUrl;
  final int duration;
  final int order;
  final bool isFree;
  final String description;

  const LessonModel({
    required this.id,
    required this.name,
    required this.videoUrl,
    required this.duration,
    required this.order,
    required this.isFree,
    required this.description,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      id: json['id'],
      name: json['name'],
      videoUrl: json['videoUrl'],
      duration: json['duration'],
      order: json['order'],
      isFree: json['isFree'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'videoUrl': videoUrl,
      'duration': duration,
      'order': order,
      'isFree': isFree,
      'description': description,
    };
  }

  @override
  List<Object?> get props => [
    id,
    name,
    videoUrl,
    duration,
    order,
    isFree,
    description,
  ];
}
