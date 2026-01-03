import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final DateTime createdAt;
  final String? description;
  final String email;
  final Map<String, dynamic> fcmTokens;
  final String? image;
  final String name;
  final int numberOfCourses;
  final int numberOfAchievements;
  final int numberOfCerts;

  const UserModel({
    required this.createdAt,
    this.description,
    required this.email,
    required this.fcmTokens,
    this.image,
    required this.name,
    required this.numberOfCourses,
    required this.numberOfAchievements,
    required this.numberOfCerts,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      numberOfCourses: json['numberOfCourses'],
      numberOfAchievements: json['numberOfAchievements'],
      numberOfCerts: json['numberOfCerts'],
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      description: json['description'],
      email: json['email'],
      fcmTokens: json['fcmTokens'] as Map<String, dynamic>,
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
      'numberOfCourses': numberOfCourses,
      'numberOfAchievements': numberOfAchievements,
      'numberOfCerts': numberOfCerts,
    };
  }

  @override
  List<Object?> get props => [createdAt];
}
