import 'package:courses_app/core/errors/failure.dart';
import 'package:courses_app/core/errors/server_exception.dart';
import 'package:courses_app/features/my_learning/data/model/my_learning_model.dart';

import 'package:courses_app/features/my_learning/data/model/my_learning_request_model.dart';

import 'package:courses_app/features/my_learning/data/model/progress_request_model.dart';
import 'package:courses_app/features/my_learning/data/source/my_learning_remote_datasource.dart';
import 'package:dartz/dartz.dart';

import 'my_learning_repo.dart';

class MyLearningRepoImpl implements MyLearningRepo {
  final MyLearningRemoteDatasource remoteDatasource;

  const MyLearningRepoImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, void>> addCourseToMyLearning(
    MyLearningRequestModel myLearningRequestModel,
  ) async {
    try {
      await remoteDatasource.addCourseToMyLearning(myLearningRequestModel);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.message));
    }
  }

  @override
  Future<Either<Failure, List<MyLearningModel>>> getMyLearningCourses(
    String userId,
  ) async {
    try {
      final myLearningCourses = await remoteDatasource.getMyLearningCourses(
        userId,
      );
      return Right(myLearningCourses);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> updateProgress(
    ProgressRequestModel progressRequestModel,
  ) async {
    try {
      await remoteDatasource.updateProgress(progressRequestModel);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.message));
    }
  }
}
