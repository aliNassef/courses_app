import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ReplyModel  extends Equatable {
  final String id;
  final String userId;
  final String userName;
  final String userImage;
  final String message;
  final DateTime createdAt;

  const ReplyModel({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.message,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() => {
    'userId': userId,
    'userName': userName,
    'userImage': userImage,
    'message': message,
    'createdAt': FieldValue.serverTimestamp(),
  };

  factory ReplyModel.fromMap(String id, Map<String, dynamic> map) {
    return ReplyModel(
      id: id,
      userId: map['userId'],
      userName: map['userName'],
      userImage: map['userImage'],
      message: map['message'],
      createdAt: (map['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }
  
  @override
  List<Object?> get props => [
    id,
    userId,
    userName,
    userImage,
    message,
    createdAt,
  ];
}
