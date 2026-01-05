import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:flutter/widgets.dart';

class CartAnimationScope extends InheritedWidget {
  const CartAnimationScope({
    super.key,
    required this.cartKey,
    required this.runAddToCartAnimation,
    required super.child,
  });

  final GlobalKey<CartIconKey> cartKey;
  final Function(GlobalKey) runAddToCartAnimation;

  static CartAnimationScope of(BuildContext context) {
    final CartAnimationScope? result = context
        .dependOnInheritedWidgetOfExactType<CartAnimationScope>();
    assert(result != null, 'No CartAnimationScope found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(CartAnimationScope oldWidget) {
    return cartKey != oldWidget.cartKey ||
        runAddToCartAnimation != oldWidget.runAddToCartAnimation;
  }
}
