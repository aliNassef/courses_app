import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../models/instructor_model.dart';

abstract class InstructorRepo {
  Future<Either<Failure, InstructorModel>> getInstructorInfo(
    String instructorId,
  );
}