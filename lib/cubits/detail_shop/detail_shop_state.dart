part of 'detail_shop_cubit.dart';

@immutable
abstract class DetailShopState {}

class DetailShopInitial extends DetailShopState {}

class SuccessGetShopDetail extends DetailShopState {
  final ShopDetail shopDetail;

  SuccessGetShopDetail({required this.shopDetail});
}

class FailedGetShopDetail extends DetailShopState {}
