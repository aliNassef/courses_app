class MyLearningRequestModel {
  final String userId;
  final String courseId;
  final Map<String, dynamic> data;

  MyLearningRequestModel({
    required this.userId,
    required this.courseId,
    required this.data,
  });
}
