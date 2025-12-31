import 'package:equatable/equatable.dart';

class SignupRequest extends Equatable {
  final String email;
  final String name;
  final String password;

  const SignupRequest({
    required this.email,
    required this.name,
    required this.password,
  });

  factory SignupRequest.fromJson(Map<String, dynamic> json) {
    return SignupRequest(
      email: json['email'],
      name: json['name'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'password': password,
    };
  }

  @override
  List<Object?> get props => [email, name, password];
}
