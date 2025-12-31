import 'package:courses_app/features/auth/data/source/auth_remote_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/failure.dart';
import '../models/signin_request.dart';
import '../models/signup_request.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepoImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, User>> signIn(SigninRequest userInput) async {
    try {
      final user = await _remoteDataSource.signIn(userInput);
      return Right(user!);
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signUp(SignupRequest userInput) async {
    try {
      final user = await _remoteDataSource.signUp(userInput);
      return Right(user!);
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }
}
