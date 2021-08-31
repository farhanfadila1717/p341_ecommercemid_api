import '../extensions/string_extension.dart';

class DeliveryModel {
  final String desc;
  final String imageUrl;

  const DeliveryModel(this.desc, this.imageUrl);
}

List<DeliveryModel> deliverys = [
  DeliveryModel('2-3 days', 'fedex'.checkout),
  DeliveryModel('2-3 days', 'usps'.checkout),
  DeliveryModel('2-3 days', 'dhl'.checkout),
];
