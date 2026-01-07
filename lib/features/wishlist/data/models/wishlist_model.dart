import 'package:equatable/equatable.dart';

class WishlistModel extends Equatable {
  final String courseId;
  final DateTime createdAt;

  const WishlistModel({required this.courseId, required this.createdAt});

  factory WishlistModel.fromMap(Map<String, dynamic> map) => WishlistModel(
    courseId: map['courseId'],
    createdAt: DateTime.parse(map['createdAt']),
  );

  Map<String, dynamic> toMap() => {
    'courseId': courseId,
    'createdAt': createdAt,
  };

  @override
  List<Object?> get props => [courseId, createdAt];
}
