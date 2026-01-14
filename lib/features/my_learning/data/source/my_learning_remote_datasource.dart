import '../../../../core/di/di.dart';
import '../model/my_learning_model.dart';
import '../model/my_learning_request_model.dart';
import '../model/progress_request_model.dart';

abstract class MyLearningRemoteDatasource {
  Future<void> addCourseToMyLearning(
    MyLearningRequestModel myLearningRequestModel,
  );
  Future<void> updateProgress(ProgressRequestModel progressRequestModel);
  Future<List<MyLearningModel>> getMyLearningCourses(String userId);
  Future<MyLearningModel> getLastLearningCourse(String userId);
}

class MyLearningRemoteDatasourceImpl implements MyLearningRemoteDatasource {
  final Database database;

  const MyLearningRemoteDatasourceImpl({required this.database});

  @override
  Future<void> addCourseToMyLearning(
    MyLearningRequestModel myLearningRequestModel,
  ) async {
    await database.addCourseToMyLearning(
      userId: myLearningRequestModel.userId,
      courseId: myLearningRequestModel.courseId,
      data: myLearningRequestModel.data,
    );
  }

  @override
  Future<void> updateProgress(ProgressRequestModel progressRequestModel) async {
    await database.updateProgress(
      userId: progressRequestModel.userId,
      courseId: progressRequestModel.courseId,
      lessonId: progressRequestModel.lessonId,
    );
  }

  @override
  Future<List<MyLearningModel>> getMyLearningCourses(String userId) async {
    final myLearningCourses = await database.getMyLearningCourses(userId);
    return myLearningCourses
        .map(
          (course) =>
              MyLearningModel.fromMap(course.data() as Map<String, dynamic>),
        )
        .toList();
  }

  @override
  Future<MyLearningModel> getLastLearningCourse(String userId) async {
    final lastLearningCourse = await database.getLastLearningCourse(userId);
    return MyLearningModel.fromMap(
      lastLearningCourse.data() as Map<String, dynamic>,
    );
  }
}
