import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/models.dart';
import '../../services/services.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitial());

  void getAllShopProduct() async {
    try {
      final result = await ContentServices.getAllDummyShop();
      final List<ProductModelNew> fish =
          result.data.where((e) => e.category == 'fish').toList();
      final List<ProductModelNew> shrimp =
          result.data.where((e) => e.category == 'shrimp').toList();
      final List<ProductModelNew> seafood =
          result.data.where((e) => e.category == 'seafood').toList();
      final List<ProductModelNew> mitra =
          result.data.where((e) => e.category == 'mitra').toList();
      final List<ProductModelNew> paket =
          result.data.where((e) => e.category == 'paket').toList();

      emit(
        SuccessGetShop(
          all: result.data,
          fish: fish,
          shrimp: shrimp,
          seafood: seafood,
          paket: paket,
          mitra: mitra,
        ),
      );
    } catch (e) {
      emit(FailedGetShop(e.toString()));
    }
  }
}
