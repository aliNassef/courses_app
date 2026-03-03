import 'package:equatable/equatable.dart';

import '../../features/courses/data/models/course_model.dart';

class SearchModel extends Equatable {
  final CourseModel course;
  final bool isSubscribed;

  const SearchModel({required this.course, required this.isSubscribed});



  @override
  List<Object?> get props => [course, isSubscribed];

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      course: CourseModel.fromMap(json['course']),
      isSubscribed: json['isSubscribed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'course': course.toMap(),
      'isSubscribed': isSubscribed,
    };
  }
}
