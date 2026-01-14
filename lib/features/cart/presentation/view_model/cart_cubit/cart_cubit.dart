import 'package:bloc/bloc.dart';
import '../../../data/repo/cart_repo.dart';
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

  void getCartItemsCount(String userId) async {
    emit(GetCartItemsCountLoading());
    final countOrFailure = await _cartRepo.getCartItemsCount(userId);
    countOrFailure.fold(
      (failure) => emit(GetCartItemsCountFailure(failure)),
      (count) {
        emit(GetCartItemsCountSuccess(count));
      },
    );
  }

  void updateCartItemsCount(int count) {
    emit(GetCartItemsCountSuccess(count));
  }

  void getCart(String userId) async {
    emit(GetCartLoading());
    final cartOrFailure = await _cartRepo.getCart(userId);
    cartOrFailure.fold(
      (failure) => emit(GetCartFailure(failure)),
      (cart) {
        final totalPrice = calcTotalPrice(cart);
        emit(GetCartLoaded(cart, totalPrice));
      },
    );
  }

  num calcTotalPrice(List<CartModel> carts) {
    num total = 0;
    for (var cart in carts) {
      total += cart.price;
    }
    return total;
  }

  void removeCartItem(String userId, String courseId) async {
    if (state is! GetCartLoaded) return;

    final currentState = (state as GetCartLoaded);
    final previousCarts = currentState.cart;

    final updatedCarts = previousCarts
        .where((cart) => cart.courseId != courseId)
        .toList();
    emit(
      GetCartLoaded(
        updatedCarts,
        calcTotalPrice(updatedCarts),
      ),
    );

    final removedOrFailure = await _cartRepo.removeCartItem(userId, courseId);

    removedOrFailure.fold(
      (failure) {
        emit(
          GetCartLoaded(
            previousCarts,
            calcTotalPrice(previousCarts),
          ),
        );
        emit(RemoveCartItemFailure(failure));
      },
      (_) {},
    );
  }
}
