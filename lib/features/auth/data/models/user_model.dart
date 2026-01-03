import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String createdAt;
  final String? description;
  final String email;
  final String fcmTokens;
  final String? image;
  final String name;

  const UserModel({
    required this.createdAt,
    this.description,
    required this.email,
    required this.fcmTokens,
    this.image,
    required this.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      createdAt: json['createdAt'],
      description: json['description'],
      email: json['email'],
      fcmTokens: json['fcmTokens'],
      image: json['image'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt,
      'description': description,
      'email': email,
      'fcmTokens': fcmTokens,
      'image': image,
      'name': name,
    };
  }

  @override
  List<Object?> get props => [createdAt];
}
