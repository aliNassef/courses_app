import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String id;
  final String name;
  final String image;
  final DateTime createdAt;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  factory CategoryModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return CategoryModel(
      id: map['id'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  @override
  List<Object?> get props => [id, name, image, createdAt];
}
