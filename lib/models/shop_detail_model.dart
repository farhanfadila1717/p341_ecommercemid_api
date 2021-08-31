class ShopDetail {
  final String id;
  final String image;
  final String title;
  final String subtitle;
  final String description;
  final String p5a;
  final String p5b;
  final String p5c;
  final String p6a;
  final String p6b;
  final String p6c;
  final String p7;
  final String p8;
  final String p9;
  final bool p10;
  final String p11a;
  final String p11b;
  final String p11c;

  const ShopDetail({
    required this.id,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.p5a,
    required this.p5b,
    required this.p5c,
    required this.p6a,
    required this.p6b,
    required this.p6c,
    required this.p7,
    required this.p8,
    required this.p9,
    required this.p10,
    required this.p11a,
    required this.p11b,
    required this.p11c,
  });

  factory ShopDetail.fromJSON(Map<String, dynamic> json) => ShopDetail(
        id: json['p1'],
        image: json['p2'],
        title: json['p4'],
        subtitle: json['p3'],
        description: json['p12'],
        p5a: json['p5a'],
        p5b: json['p5b'],
        p5c: json['p5c'],
        p6a: json['p6a'],
        p6b: json['p6b'],
        p6c: json['p6c'],
        p7: json['p7'],
        p8: json['p8'],
        p9: json['p9'],
        p10: json['p10'] == '1' ? true : false,
        p11a: json['p11a'],
        p11b: json['p11b'],
        p11c: json['p11c'],
      );

  @override
  String toString() {
    return '$id, $title';
  }
}
