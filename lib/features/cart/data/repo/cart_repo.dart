import 'package:courses_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../models/cart_model.dart';

abstract class CartRepo {
  Future<Either<Failure, void>> addToCart({
    required String userId,
    required CartModel cart,
  });
}
