import 'package:courses_app/core/services/auth/auth_service.dart';
import 'package:courses_app/features/auth/data/models/signin_request.dart';
import 'package:courses_app/features/auth/data/models/signup_request.dart';
import 'package:courses_app/features/auth/data/models/user_model.dart';
import 'package:courses_app/features/auth/data/source/auth_remote_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/services/database/database.dart';

class AuthRemoteDatasourceImpl extends AuthRemoteDataSource {
  final AuthService _authService;
  final Database _database;

  AuthRemoteDatasourceImpl(this._authService, this._database);
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

  @override
  User? getUser() {
    return _authService.currentUser;
  }

  @override
  Future<void> signOut() async {
    return _authService.signOut();
  }

  @override
  Future<UserModel> getUserProfile(String userId) async {
    final data = await _database.getUser(userId);
    return UserModel.fromJson(data.data() as Map<String, dynamic>);
  }
}
