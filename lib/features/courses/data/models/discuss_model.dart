import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class DiscussionModel extends Equatable {
  final String id;
  final String userId;
  final String userName;
  final String userImage;
  final String message;
  final String? lessonId;
  final List<int>? likes;
  final DateTime createdAt;

  const DiscussionModel({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.message,
    this.lessonId,
    required this.createdAt,
    required this.likes,
  });

  factory DiscussionModel.fromMap(String id, Map<String, dynamic> map) {
    return DiscussionModel(
      id: id,
      userId: map['userId'],
      userName: map['userName'],
      userImage: map['userImage'],
      message: map['message'],
      lessonId: map['lessonId'],
      likes: map['likes'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() => {
    'userId': userId,
    'userName': userName,
    'userImage': userImage,
    'message': message,
    'lessonId': lessonId,
    'likes': likes,
    'createdAt': FieldValue.serverTimestamp(),
  };

  @override
  List<Object?> get props => [
    id,
    userId,
    userName,
    userImage,
    message,
    lessonId,
    createdAt,
  ];
}
