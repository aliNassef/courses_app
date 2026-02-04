import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ReviewModel extends Equatable {
  final String userId;
  final String userName;
  final String userImage;
  final double rating;
  final String comment;
  final DateTime createdAt;

  const ReviewModel({
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      userId: map['userId'],
      userName: map['userName'],
      userImage: map['userImage'],
      rating: (map['rating'] as num).toDouble(),
      comment: map['comment'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
      'rating': rating,
      'comment': comment,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }

  @override
  List<Object?> get props => [
    userId,
    userName,
    userImage,
    rating,
    comment,
    createdAt,
  ];
}
