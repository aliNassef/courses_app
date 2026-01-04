import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel {
  final String courseId;
  final String title;
  final double price;
  final String image;
  final DateTime addedAt;

  const CartModel({
    required this.courseId,
    required this.title,
    required this.price,
    required this.image,
    required this.addedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'courseId': courseId,
      'title': title,
      'price': price,
      'image': image,
      'addedAt': Timestamp.fromDate(addedAt),
    };
  }

  factory CartModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return CartModel(
      courseId: map['courseId'] as String,
      title: map['title'] as String,
      price: (map['price'] as num).toDouble(),
      image: map['image'] as String,
      addedAt: (map['addedAt'] as Timestamp).toDate(),
    );
  }

  CartModel copyWith({
    String? courseId,
    String? title,
    double? price,
    String? image,
    DateTime? addedAt,
  }) {
    return CartModel(
      courseId: courseId ?? this.courseId,
      title: title ?? this.title,
      price: price ?? this.price,
      image: image ?? this.image,
      addedAt: addedAt ?? this.addedAt,
    );
  }
}
