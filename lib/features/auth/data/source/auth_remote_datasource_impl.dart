import 'package:courses_app/core/services/auth/auth_service.dart';
import 'package:courses_app/features/auth/data/models/signin_request.dart';
import 'package:courses_app/features/auth/data/models/signup_request.dart';
import 'package:courses_app/features/auth/data/source/auth_remote_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDatasourceImpl extends AuthRemoteDataSource {
  final AuthService _authService;

  AuthRemoteDatasourceImpl(this._authService);
  @override
  Future<User?> signIn(SigninRequest userInput) async {
    return _authService.signIn(
      email: userInput.email,
      password: userInput.password,
    );
  }

  @override
  Future<User?> signUp(SignupRequest userInput) async {
    return _authService.signUp(
      email: userInput.email,
      password: userInput.password,
      name: userInput.name,
    );
  }
}
