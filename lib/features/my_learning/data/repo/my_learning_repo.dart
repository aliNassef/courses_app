import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../courses/data/models/lesson_model.dart';
import '../model/my_learning_model.dart';
import '../model/my_learning_request_model.dart';
import '../model/progress_request_model.dart';

abstract class MyLearningRepo {
  Future<Either<Failure, void>> addCourseToMyLearning(
    MyLearningRequestModel myLearningRequestModel,
  );
  Future<Either<Failure, void>> updateProgress(
    ProgressRequestModel progressRequestModel,
  );
  Future<Either<Failure, List<MyLearningModel>>> getMyLearningCourses(
    String userId,
  );
  Future<Either<Failure, MyLearningModel>> getLastLearningCourse(
    String userId,
  );
  
  Future<Either<Failure, Set<String>>> getCompletedLessonsIds({
    required String userId,
    required String courseId,
  });

  Future<Either<Failure, List<LessonModel>>> getLastCompletedLessonDetails(
    String userId,
  );
}
