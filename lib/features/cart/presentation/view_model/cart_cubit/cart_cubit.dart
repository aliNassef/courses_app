import 'package:bloc/bloc.dart';
import 'package:courses_app/features/cart/data/repo/cart_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/models/cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this._cartRepo) : super(CartInitial());
  final CartRepo _cartRepo;

  void addToCart({required String userId, required CartModel cart}) async {
    emit(AddToCartLoading());
    final addedOrfailure = await _cartRepo.addToCart(
      userId: userId,
      cart: cart,
    );

    addedOrfailure.fold(
      (failure) => emit(AddToCartFailure(failure)),
      (cart) => emit(const AddToCartSuccess()),
    );
  }
}
