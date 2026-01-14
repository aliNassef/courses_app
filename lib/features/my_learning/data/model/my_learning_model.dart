import 'package:cloud_firestore/cloud_firestore.dart';

class MyLearningModel {
  final String courseId;
  final double progress;
  final int completedLessons;
  final int totalLessons;
  final String? lastLessonId;
  final String status;
  final DateTime enrolledAt;
  final DateTime updatedAt;

  MyLearningModel({
    required this.courseId,
    required this.progress,
    required this.completedLessons,
    required this.totalLessons,
    this.lastLessonId,
    required this.status,
    required this.enrolledAt,
    required this.updatedAt,
  });

  factory MyLearningModel.fromMap(Map<String, dynamic> map) {
    return MyLearningModel(
      courseId: map['courseId'],
      progress: (map['progress'] as num).toDouble(),
      completedLessons: map['completedLessons'],
      totalLessons: map['totalLessons'],
      lastLessonId: map['lastLessonId'],
      status: map['status'],
      enrolledAt: (map['enrolledAt'] as Timestamp).toDate(),
      updatedAt: (map['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'courseId': courseId,
      'progress': progress,
      'completedLessons': completedLessons,
      'totalLessons': totalLessons,
      'lastLessonId': lastLessonId,
      'status': status,
      'enrolledAt': Timestamp.fromDate(enrolledAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }
}
