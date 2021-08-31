import '../extensions/string_extension.dart';
import '../shared/shared.dart';

class ReviewModel {
  final String name;
  final int rating;
  final String description;
  final String avatar;
  final List<String> imagesUrl;

  const ReviewModel({
    required this.name,
    required this.rating,
    this.description = dummyDescription,
    required this.avatar,
    required this.imagesUrl,
  });
}

ReviewModel dummyReview = ReviewModel(
  name: 'Jane',
  rating: 4,
  avatar: 'blouse'.products,
  imagesUrl: [
    'dress1'.dress,
    'dress2'.dress,
  ],
);
