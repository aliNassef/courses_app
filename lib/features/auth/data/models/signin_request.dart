import 'package:equatable/equatable.dart';

class SigninRequest  extends Equatable{
  final String email;
  final String password;

  const SigninRequest({
    required this.email,
    required this.password,
  });

  factory SigninRequest.fromJson(Map<String, dynamic> json) {
    return SigninRequest(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  @override
  List<Object?> get props => [email, password];
}
