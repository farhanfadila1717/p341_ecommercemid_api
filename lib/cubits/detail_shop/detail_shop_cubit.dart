import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/models.dart';
import '../../services/content_services.dart';

part 'detail_shop_state.dart';

class DetailShopCubit extends Cubit<DetailShopState> {
  DetailShopCubit() : super(DetailShopInitial());

  void getDetail(String id) async {
    try {
      final result = await ContentServices.getShopDetail(id);

      emit(SuccessGetShopDetail(shopDetail: result.data));
    } catch (_) {
      emit(FailedGetShopDetail());
    }
  }
}
