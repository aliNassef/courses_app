import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/features/courses/data/models/reply_model.dart';
import 'package:equatable/equatable.dart';

class DiscussionModel extends Equatable {
  final String id;
  final String userId;
  final String userName;
  final String userImage;
  final String message;
  final String? lessonId;
  final int? likes;
  final DateTime createdAt;

  const DiscussionModel({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.message,
    this.lessonId,
    required this.createdAt,
    this.likes,
  });

  factory DiscussionModel.fromMap(String id, Map<String, dynamic> map) {
    return DiscussionModel(
      id: id,
      userId: map['userId'],
      userName: map['userName'],
      userImage: map['userImage'],
      message: map['message'],
      lessonId: map['lessonId'],
      likes: map['likesCount'] ?? 0,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() => {
    'userId': userId,
    'userName': userName,
    'userImage': userImage,
    'message': message,
    'lessonId': lessonId,
    'likesCount': likes ?? 0,
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

extension DiscussionModelX on DiscussionModel {
  ReplyModel toReplyModel({
    String? id,
    String? userId,
    String? userName,
    String? userImage,
    String? message,
    DateTime? createdAt,
  }) {
    return ReplyModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userImage: userImage ?? this.userImage,
      message: message ?? this.message,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
