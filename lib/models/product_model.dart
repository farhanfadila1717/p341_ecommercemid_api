import '../shared/shared.dart';

class ProductModelNew {
  final String id;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String category;
  final String p5;
  final String p6;
  final String p7;
  final String p8;
  final String p9;
  final String p10;

  const ProductModelNew({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.category,
    required this.p5,
    required this.p6,
    required this.p7,
    required this.p8,
    required this.p9,
    required this.p10,
  });

  factory ProductModelNew.fromJSON(Map<String, dynamic> json) =>
      ProductModelNew(
        category: json['cat'],
        id: json['p1'],
        title: json['p3'],
        subtitle: json['p4'],
        imageUrl: (json['p2'] as String)
            .replaceAll('w=800', 'w=400')
            .replaceAll('q=60', 'q=50'),
        p5: json['p5'],
        p6: json['p6'],
        p7: json['p7'],
        p8: json['p8'],
        p9: json['p9'],
        p10: json['p10'],
      );
}

class ProductModelAPI {
  final String id;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String category;

  const ProductModelAPI({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.category,
  });

  factory ProductModelAPI.fromJSON(Map<String, dynamic> json) =>
      ProductModelAPI(
        id: json['p1'],
        title: json['p3'],
        subtitle: json['p4'],
        imageUrl: (json['p2'] as String)
            .replaceAll('w=800', 'w=400')
            .replaceAll('q=60', 'q=50'),
        category: json['cat'],
      );
}

class ProductModel {
  final String title;
  final String subtitle;
  final String description;
  final int price;
  final int discountPercent;
  final String imageUrl;
  final bool isLiked;
  final int totalBuy;
  final double rating;

  const ProductModel({
    required this.title,
    required this.subtitle,
    this.description = dummyDescription,
    required this.price,
    required this.discountPercent,
    required this.imageUrl,
    this.totalBuy = 10,
    this.isLiked = false,
    this.rating = 4.5,
  });
}

const List<ProductModel> products1 = [
  ProductModel(
    title: 'Evening Dress',
    subtitle: 'Doronty',
    price: 15,
    discountPercent: 20,
    rating: 4,
    imageUrl: 'assets/images/thumbs/dress/dress2.png',
  ),
  ProductModel(
    title: 'Sporty Dress',
    subtitle: 'Sitly',
    price: 22,
    discountPercent: 15,
    imageUrl: 'assets/images/thumbs/dress/dress1.png',
  ),
  ProductModel(
    title: 'Korean T-Shirt',
    subtitle: 'Doronty',
    price: 15,
    rating: 4,
    discountPercent: 20,
    imageUrl: 'assets/images/thumbs/category/new.png',
  ),
  ProductModel(
    title: 'Student T-shirt Summer',
    subtitle: 'Sitly',
    price: 22,
    discountPercent: 15,
    imageUrl: 'assets/images/thumbs/category/clothes.png',
  ),
];

const List<ProductModel> newProduct = [
  ProductModel(
    title: 'Evening Dress',
    subtitle: 'Doronty',
    price: 15,
    discountPercent: 20,
    isLiked: true,
    imageUrl: 'assets/images/thumbs/category/clothes.png',
  ),
  ProductModel(
    title: 'Sporty Dress',
    subtitle: 'Sitly',
    price: 22,
    discountPercent: 15,
    imageUrl: 'assets/images/thumbs/category/pullover.png',
  ),
  ProductModel(
    title: 'Korean T-Shirt',
    subtitle: 'Doronty',
    price: 15,
    discountPercent: 20,
    imageUrl: 'assets/images/thumbs/category/blouse.png',
  ),
  ProductModel(
    title: 'Student T-shirt Summer',
    subtitle: 'Sitly',
    price: 22,
    discountPercent: 15,
    imageUrl: 'assets/images/thumbs/category/tshirt.png',
  ),
];
