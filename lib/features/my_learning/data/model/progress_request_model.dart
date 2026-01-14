class ProgressRequestModel {
  final String userId;
  final String courseId;
  final String lessonId;

  ProgressRequestModel({
    required this.userId,
    required this.courseId,
    required this.lessonId,
  });

  Map<String, String> toMap() {
    return {
      'userId': userId,
      'courseId': courseId,
      'lessonId': lessonId,
    };
  }
}
