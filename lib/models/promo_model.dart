import 'package:flutter/material.dart';

class PromoModel {
  final String title;
  final String subtitle;
  final int discount;
  final int days;
  final bool withImage;
  final Color color;

  const PromoModel(this.title, this.subtitle, this.discount, this.days,
      this.withImage, this.color);
}

List<PromoModel> promos = [
  PromoModel('Personal offer', 'mypromocode2021', 10, 9, false, Colors.red),
  PromoModel('Summer Sale', 'summersale', 15, 11, true, Colors.red),
  PromoModel(
      'Personal offer', 'mypromocode2021', 22, 15, false, Colors.black87),
];
