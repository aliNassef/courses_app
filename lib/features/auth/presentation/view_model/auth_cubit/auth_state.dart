part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class Authenticated extends AuthState {}

final class UnAuthenticated extends AuthState {}

final class AuthSuccess extends AuthState {
  final User user;

  const AuthSuccess({required this.user});

  @override
  List<Object> get props => [user];
}

final class AuthFailure extends AuthState {
  final Failure failure;

  const AuthFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}

final class AcceptTermsAndConditions extends AuthState {
  final bool termsAndConditions;
  const AcceptTermsAndConditions({required this.termsAndConditions});

  @override
  List<Object> get props => [termsAndConditions];
}

final class GetUserProfileLoaded extends AuthState {
  final UserModel user;

  const GetUserProfileLoaded({required this.user});

  @override
  List<Object> get props => [user];
}

final class GetUserProfileFailure extends AuthState {
  final Failure failure;

  const GetUserProfileFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}

final class GetUserProfileLoading extends AuthState {
  const GetUserProfileLoading();

  @override
  List<Object> get props => [];
}
