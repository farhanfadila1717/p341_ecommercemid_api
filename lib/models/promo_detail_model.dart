class DetailPromoModel {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final String discountPrize;
  final String originalPrize;
  final String quantity;
  final String note;
  final String imageUrl;

  const DetailPromoModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.discountPrize,
    required this.originalPrize,
    required this.quantity,
    required this.note,
    required this.imageUrl,
  });

  factory DetailPromoModel.fromJSON(Map<String, dynamic> json) =>
      DetailPromoModel(
        id: json['p1'],
        title: json['p3'],
        subtitle: json['p4'],
        description: json['p5'],
        discountPrize: json['p6'],
        originalPrize: json['p7'],
        quantity: json['p8'],
        note: json['p9'],
        imageUrl: json['p2'],
      );
}
