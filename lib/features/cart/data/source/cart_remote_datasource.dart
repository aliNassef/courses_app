import 'package:courses_app/core/di/di.dart';

import '../models/cart_model.dart';

abstract class CartRemoteDataSource {
  Future<void> addToCart({
    required String userId,
    required CartModel cart,
  });
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final Database _db;

  CartRemoteDataSourceImpl({required Database db}) : _db = db;
  @override
  Future<void> addToCart({
    required String userId,
    required CartModel cart,
  }) async {
    await _db.addToCart(
      userId: userId,
      courseId: cart.courseId,
      data: cart.toMap(),
    );
  }
}
