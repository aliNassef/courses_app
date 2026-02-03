import 'package:equatable/equatable.dart';

import 'lesson_model.dart';

class ChapterModel extends Equatable {
  final String title;
  final String id;
  final List<LessonModel> lessons;

  const ChapterModel({
    required this.title,
    required this.id,
    required this.lessons,
  });

  factory ChapterModel.fromJson(Map<String, dynamic> json) {
    return ChapterModel(
      title: json['title'],
      id: json['id'],
      lessons: (json['lessons'] as List<dynamic>)
          .map((e) => LessonModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'id': id,
      'lessons': lessons.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [id];
}
