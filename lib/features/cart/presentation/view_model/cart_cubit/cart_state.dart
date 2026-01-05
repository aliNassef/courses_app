part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class AddToCartLoading extends CartState {}

final class AddToCartSuccess extends CartState {
  const AddToCartSuccess();
}

final class AddToCartFailure extends CartState {
  final Failure failure;

  const AddToCartFailure(this.failure);

  @override
  List<Object> get props => [failure];
}

final class GetCartItemsCountLoading extends CartState {}

final class GetCartItemsCountSuccess extends CartState {
  final int count;

  const GetCartItemsCountSuccess(this.count);

  GetCartItemsCountSuccess copyWith({
    int? count,
  }) {
    return GetCartItemsCountSuccess(
      count ?? this.count,
    );
  }

  @override
  List<Object> get props => [count];
}

final class GetCartItemsCountFailure extends CartState {
  final Failure failure;

  const GetCartItemsCountFailure(this.failure);

  @override
  List<Object> get props => [failure];
}
