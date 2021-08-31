class PriceModel {
  final String symbol;
  final String originalPrice;
  final String discountPrice;
  final String note;

  const PriceModel({
    required this.symbol,
    required this.originalPrice,
    required this.discountPrice,
    required this.note,
  });

  factory PriceModel.fromJSON(
          Map<String, dynamic> json, int parrent, String symbol) =>
      PriceModel(
        symbol: symbol,
        originalPrice: json['p$parrent'],
        discountPrice: json['p${parrent + 3}'],
        note: json['p${parrent + 6}'],
      );
}
