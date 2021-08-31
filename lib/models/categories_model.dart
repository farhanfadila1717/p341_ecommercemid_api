import '../extensions/string_extension.dart';

class CategoriesModel {
  final String title;
  final String imageUrl;

  const CategoriesModel({
    required this.title,
    required this.imageUrl,
  });
}

List<CategoriesModel> categories = [
  CategoriesModel(
    title: 'Accessories',
    imageUrl: 'accessories'.category,
  ),
  CategoriesModel(
    title: 'Blouse',
    imageUrl: 'blouse'.category,
  ),
  CategoriesModel(
    title: 'Clothes',
    imageUrl: 'clothes'.category,
  ),
  CategoriesModel(
    title: 'New',
    imageUrl: 'new'.category,
  ),
  CategoriesModel(
    title: 'Pullover',
    imageUrl: 'pullover'.category,
  ),
  CategoriesModel(
    title: 'Shirt',
    imageUrl: 'shirt'.category,
  ),
  CategoriesModel(
    title: 'Shoes',
    imageUrl: 'shoes'.category,
  ),
  CategoriesModel(
    title: 'Top banner',
    imageUrl: 'topbanner1'.category,
  ),
  CategoriesModel(
    title: 'T-shirt',
    imageUrl: 'tshirt'.category,
  ),
];
