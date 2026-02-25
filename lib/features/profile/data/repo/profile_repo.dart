 

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class ProfileRepo {
  Future<Either<Failure, int>> getUserSubscriptions(String userId);
  Future<Either<Failure, void>> getUserProfile(String userId);
  Future<Either<Failure, void>> updateProfile(
    String userId,
    Map<String, dynamic> data,
  );
  Future<Either<Failure, void>> updateProfileImage(String userId, String imageUrl);
}
