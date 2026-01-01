import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/failure.dart';
import '../models/signin_request.dart';
import '../models/signup_request.dart';

abstract class AuthRepo {
  Future<Either<Failure, User>> signIn(SigninRequest userInput);

  Future<Either<Failure, User>> signUp(SignupRequest userInput);

  User? getUser();

  Future<Either<Failure, void>> signOut();
}
