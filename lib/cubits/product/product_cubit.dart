import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/models.dart';
import '../../services/services.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  void getAllProduct() async {
    try {
      print('here');
      final result = await ContentServices.getAllDummyProduct();

      if (result.data.isNotEmpty) {
        final ProductModelNew home =
            result.data.where((e) => e.category == 'home').toList().first;
        final ProductModelNew recomended = result.data
            .where((e) => e.category == 'recommended')
            .toList()
            .first;
        final ProductModelNew collection =
            result.data.where((e) => e.category == 'collection').toList().first;
        final ProductModelNew summer =
            result.data.where((e) => e.category == 'summer').toList().first;
        final List<ProductModelNew> newProduct =
            result.data.where((e) => e.category == 'new').toList();
        final List<ProductModelNew> sale =
            result.data.where((e) => e.category == 'sale').toList();
        final List<ProductModelNew> promo =
            result.data.where((e) => e.category == 'promo').toList();
        final List<ProductModelNew> favorite =
            result.data.where((e) => e.category == 'favorite').toList();

        List<String> category = [];

        result.data.forEach((element) {
          if (!category.contains(element.category)) {
            category.add(element.category);
          }
        });

        emit(
          SuccessGetProduct(
            category: category,
            home: home,
            recomended: recomended,
            collection: collection,
            summer: summer,
            promo: promo,
            newProduct: newProduct,
            sale: sale,
            favorite: favorite,
          ),
        );
      }
    } catch (e) {
      emit(FailedGetProduct('Gagal mendapatkan produk!'));
    }
  }
}
