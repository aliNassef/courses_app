import 'package:courses_app/core/errors/server_exception.dart';
import 'package:courses_app/features/cart/data/models/cart_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../source/cart_remote_datasource.dart';
import 'cart_repo.dart';

class CartRepoImpl extends CartRepo {
  final CartRemoteDataSource _remoteDataSource;

  CartRepoImpl({required CartRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, void>> addToCart({
    required String userId,
    required CartModel cart,
  }) async {
    try {
      await _remoteDataSource.addToCart(userId: userId, cart: cart);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.message));
    }
  }
}
