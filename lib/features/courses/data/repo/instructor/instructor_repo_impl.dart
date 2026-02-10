import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/errors/server_exception.dart';
import '../../models/instructor_model.dart';
import '../../source/instructor_remote_datasource.dart';
import 'instructor_repo.dart';

class InstructorRepoImpl implements InstructorRepo {
  final InstructorRemoteDatasource remoteDatasource;

  InstructorRepoImpl({required this.remoteDatasource});
  @override
  Future<Either<Failure, InstructorModel>> getInstructorInfo(
    String instructorId,
  ) async {
    try {
      final instructor = await remoteDatasource.getInstructorInfo(
        instructorId,
      );
      return Right(instructor);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.message));
    }
  }
}