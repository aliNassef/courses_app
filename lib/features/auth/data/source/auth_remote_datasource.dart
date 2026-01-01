import 'package:firebase_auth/firebase_auth.dart';

import '../models/signin_request.dart';
import '../models/signup_request.dart';

abstract class AuthRemoteDataSource {
  Future<User?> signIn(SigninRequest userInput);

  Future<User?> signUp(SignupRequest userInput);

  User? getUser();

  Future<void> signOut();
}
