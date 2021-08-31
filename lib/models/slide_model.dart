class SlideModel {
  final String title;
  final String imageUrl;

  const SlideModel({required this.title, required this.imageUrl});
}

const List<SlideModel> slides = [
  SlideModel(
    title: 'Fashion\nsale',
    imageUrl: 'assets/images/splash/splash-home.png',
  ),
  SlideModel(
    title: 'Street clothes',
    imageUrl: 'assets/images/splash/topbanner.png',
  ),
  SlideModel(
    title: 'New collection',
    imageUrl: 'assets/images/splash/main3.png',
  ),
  SlideModel(
    title: 'Men\'s hoodies',
    imageUrl: 'assets/images/splash/sidebanner.png',
  ),
  SlideModel(
    title: 'Black',
    imageUrl: 'assets/images/splash/bottombanner.png',
  ),
];
