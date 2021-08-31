part of '../catalog_page.dart';

class CardProductCatalogOne extends StatelessWidget {
  const CardProductCatalogOne({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ProductModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailProductPage(product: item)));
              },
              child: Container(
                height: 110,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                  children: [
                    Image.asset(
                      item.imageUrl,
                      fit: BoxFit.cover,
                      height: 110,
                      width: 110,
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              item.title,
                              maxLines: 1,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              item.subtitle,
                              maxLines: 1,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            Row(
                              children: List.generate(
                                5,
                                (index) => Icon(
                                  item.rating > index
                                      ? Icons.star
                                      : Icons.star_outline_rounded,
                                  color: item.rating > index
                                      ? Colors.amber
                                      : Colors.grey,
                                  size: 18,
                                ),
                              )..add(
                                  Text(
                                    '(${item.totalBuy})',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                            ),
                            Text(
                                '${(item.price - (item.price * (item.discountPercent * .01))).round()}\$')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -15,
            right: 10,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              elevation: 2,
              mini: true,
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16)),
                  ),
                  builder: (BuildContext context) {
                    return ModalSize(
                      title: 'ADD TO FAVORITE',
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Visibility(
                  visible: item.isLiked,
                  child: Icon(Icons.favorite_rounded, color: Colors.red),
                  replacement:
                      Icon(Icons.favorite_outline_rounded, color: Colors.grey),
                ),
              ),
              heroTag: '${item.title}${DateTime.now().microsecondsSinceEpoch} ',
            ),
          ),
        ],
      ),
    );
  }
}
