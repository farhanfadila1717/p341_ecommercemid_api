import '../shared/shared.dart';

import 'models.dart';

class CartModel {
  final ProductModel product;
  final String color;
  final String size;

  const CartModel(
      {required this.product, required this.color, required this.size});
}

List<CartModel> carts = [
  CartModel(
      product: newProduct.first, color: colorsText.last, size: sizes.last),
  CartModel(
      product: newProduct.last, color: colorsText.first, size: sizes.first),
  CartModel(product: products1.first, color: colorsText[1], size: sizes[1]),
];
