import '../../../../core/di/di.dart';

import '../models/cart_model.dart';

abstract class CartRemoteDataSource {
  Future<void> addToCart({
    required String userId,
    required CartModel cart,
  });

  Future<int> getCartItemsCount(String userId);

  Future<List<CartModel>> getCart(String userId);
  Future<void> removeCartItem(String userId, String courseId);
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

  @override
  Future<int> getCartItemsCount(String userId) async {
    final count = await _db.getCartItemsCount(userId);
    return count;
  }

  @override
  Future<List<CartModel>> getCart(String userId) async {
    final carts = await _db.getCartItems(userId);
    return carts
        .map((e) => CartModel.fromMap(e.data() as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> removeCartItem(String userId, String courseId) async =>
      _db.removeCartItem(userId, courseId);
}
