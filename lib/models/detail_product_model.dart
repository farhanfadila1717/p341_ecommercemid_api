import 'price_model.dart';

class DetailProductModel {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final String imageUrl;
  final PriceModel sPrize;
  final PriceModel mPrize;
  final PriceModel lPrize;

  const DetailProductModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imageUrl,
    required this.sPrize,
    required this.mPrize,
    required this.lPrize,
  });

  factory DetailProductModel.fromJSON(Map<String, dynamic> json) =>
      DetailProductModel(
        id: json['p1'],
        title: json['p3'],
        subtitle: json['p4'],
        description: json['p5'],
        imageUrl: (json['p2'] as String)
            .replaceAll('w=800', 'w=300')
            .replaceAll('q=60', 'q=40'),
        sPrize: PriceModel.fromJSON(json, 6, 'S'),
        mPrize: PriceModel.fromJSON(json, 7, 'M'),
        lPrize: PriceModel.fromJSON(json, 8, 'L'),
      );
}
