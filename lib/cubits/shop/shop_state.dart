part of 'shop_cubit.dart';

@immutable
abstract class ShopState {}

class ShopInitial extends ShopState {}

class SuccessGetShop extends ShopState {
  final List<ProductModelNew> all;
  final List<ProductModelNew> fish;
  final List<ProductModelNew> shrimp;
  final List<ProductModelNew> seafood;
  final List<ProductModelNew> paket;
  final List<ProductModelNew> mitra;

  SuccessGetShop({
    required this.all,
    required this.fish,
    required this.shrimp,
    required this.seafood,
    required this.paket,
    required this.mitra,
  });
}

class FailedGetShop extends ShopState {
  final String message;

  FailedGetShop(this.message);
}
