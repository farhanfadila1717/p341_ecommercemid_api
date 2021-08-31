part of '../home_page.dart';

class CarouselHomePage extends StatefulWidget {
  const CarouselHomePage({
    Key? key,
    required this.size,
    required this.items,
  }) : super(key: key);

  final Size size;
  final List<ProductModelNew> items;

  @override
  _CarouselHomePageState createState() => _CarouselHomePageState();
}

class _CarouselHomePageState extends State<CarouselHomePage> {
  int _indexShowCarousel = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: widget.size.width,
      child: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: widget.items.length,
            itemBuilder: (context, index, pageViewIndex) {
              final ProductModelNew promo = widget.items[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PromoDetailPage(id: promo.id)));
                  print('Tapped');
                },
                child: Stack(
                  children: [
                    SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: Image.network(promo.imageUrl, fit: BoxFit.cover),
                    ),
                    SizedBox.expand(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black87,
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            promo.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              height: 1.3,
                            ),
                            maxLines: 2,
                          ),
                          const Padding(padding: const EdgeInsets.only(top: 4)),
                          Text(
                            promo.subtitle,
                            style: TextStyle(color: Colors.white),
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              height: 220,
              aspectRatio: 16 / 8,
              viewportFraction: 1,
              onPageChanged: (index, carouselPageReason) {
                setState(() {
                  _indexShowCarousel = index;
                });
              },
            ),
          ),
          Positioned(
              bottom: 10,
              right: 10,
              child: Row(
                children: List.generate(
                  widget.items.length,
                  (index) => AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 5,
                    margin: const EdgeInsets.only(left: 5),
                    width: index == _indexShowCarousel ? 20 : 5,
                    decoration: BoxDecoration(
                      color: index == _indexShowCarousel
                          ? Colors.white
                          : Colors.white54,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
