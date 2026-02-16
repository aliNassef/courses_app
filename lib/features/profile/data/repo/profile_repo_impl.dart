import 'dart:io';

import 'package:courses_app/features/profile/data/repo/profile_repo.dart';
import 'package:courses_app/features/profile/data/source/profile_remote_datasource.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_exception.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDataSource _profileRemoteDataSource;
  ProfileRepoImpl({required ProfileRemoteDataSource profileRemoteDataSource})
    : _profileRemoteDataSource = profileRemoteDataSource;
  @override
  Future<Either<Failure, void>> getUserProfile(String userId) async {
    // TODO: implement getUserProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> getUserSubscriptions(String userId) async {
    try {
      final result = await _profileRemoteDataSource.getUserSubscriptions(userId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> updateProfile(
    String userId,
    Map<String, dynamic> data,
  ) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateProfileImage(String userId, File image) {
    // TODO: implement updateProfileImage
    throw UnimplementedError();
  }
}
