import 'package:bloc/bloc.dart';
import 'package:courses_app/core/errors/failure.dart';
import 'package:courses_app/features/auth/data/models/signup_request.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../data/models/signin_request.dart';
import '../../../data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;

  AuthCubit(this._authRepo) : super(AuthInitial());

  Future<void> signIn(SigninRequest userInput) async {
    emit(AuthLoading());
    final userOrFailure = await _authRepo.signIn(userInput);
    userOrFailure.fold(
      (failure) => emit(AuthFailure(failure: failure)),
      (user) => emit(AuthSuccess(user: user)),
    );
  }

  Future<void> signUp(SignupRequest userInput) async {
    emit(AuthLoading());
    final userOrFailure = await _authRepo.signUp(userInput);
    userOrFailure.fold(
      (failure) => emit(AuthFailure(failure: failure)),
      (user) => emit(AuthSuccess(user: user)),
    );
  }

  void acceptTermsAndConditions(bool value) {
    emit(AcceptTermsAndConditions(termsAndConditions: value));
  }

  void checkAuthState() {
    final user = _authRepo.getUser();
    if (user != null) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }

  Future<void> signOut() async {
    emit(AuthLoading());
    final failureOrUnit = await _authRepo.signOut();
    failureOrUnit.fold(
      (failure) => emit(AuthFailure(failure: failure)),
      (unit) => emit(UnAuthenticated()),
    );
  }
}
