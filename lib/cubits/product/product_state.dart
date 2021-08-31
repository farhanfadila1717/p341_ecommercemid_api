part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class SuccessGetProduct extends ProductState {
  final List<String> category;
  final ProductModelNew home;
  final ProductModelNew recomended;
  final ProductModelNew collection;
  final ProductModelNew summer;
  final List<ProductModelNew> newProduct;
  final List<ProductModelNew> sale;
  final List<ProductModelNew> promo;
  final List<ProductModelNew> favorite;

  SuccessGetProduct({
    required this.category,
    required this.home,
    required this.recomended,
    required this.collection,
    required this.summer,
    required this.promo,
    required this.newProduct,
    required this.sale,
    required this.favorite,
  });
}

class FailedGetProduct extends ProductState {
  final String message;

  FailedGetProduct(this.message);
}
